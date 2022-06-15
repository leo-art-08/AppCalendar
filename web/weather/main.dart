import 'package:flutter/material.dart';

void main() => runApp(WeatherCart());

class WeatherCart extends StatefulWidget {
  const WeatherCart({Key? key}) : super(key: key);

  @override
  State<WeatherCart> createState() => _WeatherCartState();
}

class _WeatherCartState extends State<WeatherCart> {
  int temperature = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather_icons/clear.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[Text(temperature.toString() + ' C')],
          ),
        ),
      ),
    );
  }
}
