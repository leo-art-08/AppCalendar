// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:calendarappnew/resource/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

//var dayInfo = DateTime.now();
//var dateFormate = DateFormat('EEEE, d MMM, yyy').format(dayInfo);

class HomeWeatherPage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async {
    //var position = await GetPosition();
    data = await client.getData('47.2313', '39.7232');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          return Container(
            child: Column(
              children: [
                //back фон
                Container(
                  height: size.height * 0.5,
                  width: size.width,
                  padding: EdgeInsets.only(top: 40.0),
                  margin: EdgeInsets.only(right: 15.0, left: 15.0, top: 25.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(40),
                    // ignore: prefer_const_constructors
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffbdc3c7),
                        Colors.red,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85],
                    ),
                  ),
                  //щапка информации
                  child: Column(
                    children: [
                      Text(
                        '${data?.cityName}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${data?.localtime}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                        ),
                      ),
                      Image.network(
                        'http:${data?.icon}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        '${data?.condition}',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "+${data?.temp}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                    ],
                  ),
                ),
                //показатели
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/veter.png',
                            height: 65,
                            width: 50,
                          ),
                          Text(
                            'Ветер',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.wind} м/с',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/pressure.png',
                            height: 65,
                            width: 45,
                          ),
                          Text(
                            'Давление',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.pressure} мл/б',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/vlaga.png',
                            height: 65,
                            width: 40,
                          ),
                          Text(
                            'Влажность',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.humidity}%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/03d.png',
                            height: size.height * 0.1,
                            width: size.width,
                          ),
                          Text(
                            'Ошущается',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '+ ${data?.feels_like} ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SevenDays(),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SevenDays extends StatelessWidget {
  const SevenDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: sevenDay.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(sevenDay[index].day, style: TextStyle(fontSize: 20)),
                    Container(
                      width: 165,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(sevenDay[index].image),
                            width: 30,
                          ),
                          SizedBox(width: 50),
                          Text(
                            sevenDay[index].name,
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "+" + sevenDay[index].max.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "+" + sevenDay[index].min.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> GetPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

//WetherModel.dart
class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var pressure;
  var feels_like;
  var max;
  var min;
  var day;
  var image;
  var name;
  var localtime;

  Weather(
      {this.cityName,
      this.icon,
      this.condition,
      this.temp,
      this.wind,
      this.humidity,
      this.wind_dir,
      this.pressure,
      this.feels_like,
      this.max,
      this.min,
      this.day,
      this.image,
      this.name,
      this.localtime});
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_mph'];
    humidity = json['current']['humidity'];
    pressure = json['current']['pressure_mb'];
    feels_like = json['current']['feelslike_c'];
    localtime = json['location']['localtime'];
  }
}

//getLocation.dart

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=442e9dc840c84c4b992150629221104 &q=$latitude,$longitude&lon&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}

List<Weather> sevenDay = [
  Weather(
      max: 27,
      min: 21,
      image: "assets/sunny_2d.png",
      day: "29.05",
      name: "Солнце"),
  Weather(
      max: 30,
      min: 22,
      image: "assets/sunny_2d.png",
      day: "30.05",
      name: "Солнце"),
  Weather(
      max: 35,
      min: 25,
      image: "assets/sunny_2d.png",
      day: "31.05",
      name: "Солнце"),
  Weather(
      max: 35,
      min: 26,
      image: "assets/sunny_2d.png",
      day: "01.06",
      name: "Солнце"),
  Weather(
      max: 36,
      min: 26,
      image: "assets/sunny_2d.png",
      day: "02.06",
      name: "Солнце"),
  Weather(
      max: 34,
      min: 24,
      image: "assets/sunny_2d.png",
      day: "03.06",
      name: "Солнце"),
  Weather(
      max: 34,
      min: 22,
      image: "assets/sunny_2d.png",
      day: "04.06",
      name: "Солнце")
];
