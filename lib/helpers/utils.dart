import 'package:calendarappnew/models/category.dart';
import 'package:flutter/material.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          color: Colors.black,
          name: "Artem",
          imgName: "Art1",
          subCategories: []),
      Category(
          color: Colors.black,
          name: "Artemn",
          imgName: "Art2",
          subCategories: []),
      Category(
          color: Colors.black,
          name: "Artemm",
          imgName: "Art3",
          subCategories: []),
    ];
  }
}
