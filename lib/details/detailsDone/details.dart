import 'package:calendarappnew/resource/colors.dart';
import 'package:flutter/material.dart';

class DetailsDone extends StatelessWidget {
  final String image;
  DetailsDone(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(image),
              Container(
                margin: EdgeInsets.all(20),
                child: Text("DONE"),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
