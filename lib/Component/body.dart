import 'package:calendarappnew/Component/profile_menu.dart';
import 'package:calendarappnew/Component/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

/*class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(height: 40),
        ProfileMenu(
          icon: "assets/icons/Camera Icon.svg",
          text: "Аккаунт",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Настройки",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          text: "Помощь",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text: "Выйти",
          press: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
*/