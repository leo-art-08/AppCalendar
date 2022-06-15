import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: ListView(
          children: [
            Text(
              "Настройки",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Аккаунт",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 1,
            ),
            AccOption(context, "Язык"),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up,
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Звук",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 5,
            ),
            Opovech("Оповещения", false),
            SizedBox(
              height: 120,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Выйти из Аккаунта",
                  style: TextStyle(
                      fontSize: 17, letterSpacing: 2.3, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row Opovech(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(value: isActive, onChanged: (bool val) {}))
      ],
    );
  }

  GestureDetector AccOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Русский"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("England"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Espania"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Назад"))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[500],
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}
