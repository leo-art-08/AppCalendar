import 'package:calendarappnew/SplashScreen.dart';
import 'package:calendarappnew/Weather.dart';
import 'package:calendarappnew/calendar.dart';

import 'package:calendarappnew/profile/profile.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:calendarappnew/Screens/Login_Screen.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../event.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);
  final List<Widget> _widgetOptions = <Widget>[
    Calendar(),
    menuCard(),
    HomeWeatherPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        //backgroundColor: Colors.blueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
              color: Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
              color: Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
/*
class HomePageCal extends StatefulWidget {
  const HomePageCal({Key? key}) : super(key: key);

  @override
  State<HomePageCal> createState() => _HomePageCalState();
}

class _HomePageCalState extends State<HomePageCal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          Container(
            child: DatePickerDialog(
              DateTime
            ),
          )
        ],
      ),
    );
  }
}

_addTaskBar() {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("Сегодня")
            ],
          ),
        ),
        MyButton(label: "Добавить", onTap: () => null)
      ],
    ),
  );
}

_appBar() {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        print("tapped");
      },
      child: Icon(
        Icons.nightlight_round,
        size: 20,
      ),
    ),
    actions: [
      Icon(
        Icons.person,
        size: 20,
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

//add
class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label),
      ),
    );
  }
}
*/