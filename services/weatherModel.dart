import 'package:flutter/cupertino.dart';

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
      this.name});
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    pressure = json['current']['pressure_mb'];
    feels_like = json['current']['feelslike_c'];
  }
}

List<Weather> sevenDay = [
  Weather(
      max: 20, min: 14, image: "assets/rainy_2d.png", day: "Пн", name: "Дождь"),
  Weather(
      max: 22,
      min: 16,
      image: "assets/thunder_2d.png",
      day: "Вт",
      name: "Гром"),
  Weather(
      max: 19, min: 13, image: "assets/rainy_2d.png", day: "Ср", name: "Дождь"),
  Weather(
      max: 18, min: 12, image: "assets/rainy_2d.png", day: "Чт", name: "Дождь"),
  Weather(
      max: 23,
      min: 19,
      image: "assets/sunny_2d.png",
      day: "Пт",
      name: "Солнце"),
  Weather(
      max: 25,
      min: 17,
      image: "assets/sunny_2d.png",
      day: "Сб",
      name: "Солнце"),
  Weather(
      max: 21, min: 18, image: "assets/sunny_2d.png", day: "Вс", name: "Солнце")
];
