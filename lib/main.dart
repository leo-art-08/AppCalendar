//import 'package:calendarappnew/SplashScreen.dart';
import 'package:calendarappnew/Screens/Home_Screen.dart';
import 'package:calendarappnew/body_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Login_Screen.dart';
import 'package:calendarappnew/Screens/Login_Screen.dart';
import 'SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
