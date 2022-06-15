import 'dart:ui';

import 'package:flutter/material.dart';

class Category {
  String? name;
  String? icon;
  Color? color;
  String? imgName;
  List<Category>? subCategories;

  Category(
      {this.name, this.icon, this.color, this.imgName, this.subCategories});
}
