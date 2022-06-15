import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:calendarappnew/Component/button.dart';
import '../constants.dart';
import 'Home_Screen.dart';
import 'Register_Screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: formkey,
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Stack(
                  children: [
                    //изменение интерфейса
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white24,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],

                          // бэк градиентом
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45, vertical: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon2.png',
                                width: 250,
                                height: 250,
                              ),
                              SizedBox(height: 40),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  email = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "ВВЕДИТЕ E-MAIL";
                                  }
                                },
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(fontSize: 18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Colors.grey[300],
                                ),
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "ВВЕДИТЕ ПАРОЛЬ";
                                  }
                                },
                                onChanged: (value) {
                                  password = value;
                                },
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  hintText: 'Пароль',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(fontSize: 18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Colors.grey[300],
                                ),
                              ),
                              const SizedBox(height: 60),
                              LoginSignupButton(
                                title: 'Войти',
                                ontapp: () async {
                                  if (formkey.currentState!.validate()) {
                                    setState(() {
                                      isloading = true;
                                    });
                                    try {
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);

                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (contex) => HomeScreen(),
                                        ),
                                      );

                                      setState(() {
                                        isloading = false;
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text(
                                              "Не получилось войти, логин или пароль неправильные"),
                                          content: Text('${e.message}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Text('ОК'),
                                            ),
                                          ],
                                        ),
                                      );
                                      print(e);
                                    }
                                    setState(() {
                                      isloading = false;
                                    });
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Забыли пароль?"),
                              Divider(
                                height: 10,
                                thickness: 2,
                                indent: 18,
                                endIndent: 18,
                                color: Colors.grey[400],
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Уже есть Аккаунт?",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                    SizedBox(width: 10),
                                    Hero(
                                      tag: '1',
                                      child: Text(
                                        'Зарегистрироваться',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
