import 'package:flutter/material.dart';

class LoginSignupButton extends StatelessWidget {
  final String title;
  final dynamic ontapp;

  LoginSignupButton({required this.title, required this.ontapp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SizedBox(
        height: 47,
        child: ElevatedButton(
          onPressed: ontapp,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 22),
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ))),
        ),
      ),
    );
  }
}
