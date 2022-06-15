import 'package:calendarappnew/body_card.dart';
import 'package:flutter/material.dart';

class menuCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyCard(),
      backgroundColor: Colors.white,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "ГАЛЕРЕЯ ОБРАЗОВ",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'Comforta',
          color: Colors.grey[800],
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xffE5E6E4),
    );
  }
}
