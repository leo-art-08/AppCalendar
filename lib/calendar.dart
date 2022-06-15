// ignore_for_file: non_constant_identifier_names, unused_field, avoid_web_libraries_in_flutter, unnecessary_null_comparison, unused_element

import 'dart:ffi';
import 'dart:io';

import 'package:calendarappnew/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.twoWeeks;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

// загрузка фото через камеру
  File? image;
  //final imagePicker = ImagePicker();
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  //загрузка фото через галерею

  //final imagePicker = ImagePicker();
  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "КАЛЕНДАРЬ",
          style: TextStyle(
            color: Color(0xff424242),
            fontFamily: 'Comfortaa',
          ),
        ),
        backgroundColor: Color(0xffE5E6E4),
        centerTitle: true,
      ),
      body: Container(
        child: CalendarEventsPage(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => Container(
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text("Событие"),
              content: TextFormField(
                controller: _eventController,
              ),
              actions: [
                Container(
                    margin: EdgeInsets.only(right: 200),
                    width: 100,
                    height: 100,
                    child: image != null
                        ? Image.file(image!)
                        : Text("Место для фото")),
                TextButton(
                    child: Text(
                      "Камера",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    onPressed: () {
                      pickImage();
                      //getImage();
                    }),
                TextButton(
                    child: Text(
                      "Галерея",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    onPressed: () {
                      pickImageC();
                      //getImage();
                    }), //getImage
                TextButton(
                  child: Text(
                    "Отмена",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  onPressed: () {
                    if (_eventController.text.isEmpty) {
                    } else {
                      if (selectedEvents[selectedDay] != null) {
                        selectedEvents[selectedDay]?.add(
                          Event(title: _eventController.text),
                        );
                      } else {
                        selectedEvents[selectedDay] = [
                          Event(title: _eventController.text)
                        ];
                      }
                    }

                    Navigator.pop(context);
                    _eventController.clear();
                    setState(() {});
                    return;
                  },
                ),
              ],
            ),
          ),
        ),
        label: Text("Событие"),
        backgroundColor: Colors.grey[800],
        icon: Icon(Icons.add),
      ),
    );
  }

// формирование календаря
  Container CalendarEventsPage() {
    return Container(
      child: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.grey[600],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.grey[600],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: false,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Text(
                event.title,
              ),
            ),
          ),

          //events
          SizedBox(
            height: 20,
          ),

          Container(
              margin: EdgeInsets.only(right: 200),
              width: 200,
              height: 150,
              child:
                  image != null ? Image.file(image!) : Text("Место для фото")),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

/*Container(
              child: _image == null
                  ? Text("Место для фото")
                  : Image.file(
                      _image!,
                    )), */