import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product {
  final String image, title, decription;
  final int price, size, id;
  final Color color;

  Product({
    required this.image,
    required this.title,
    required this.decription,
    required this.price,
    required this.size,
    required this.id,
    required this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "da",
    price: 123,
    size: 12,
    decription: dummyText,
    image: "assets/profile_1.jpg",
    color: Color(0xFF3D82AE),
  ),
  Product(
    id: 2,
    title: "da",
    price: 123,
    size: 12,
    decription: dummyText,
    image: "assets/profile_1.jpg",
    color: Color(0xFF3D82AE),
  ),
];
String dummyText = "sdsfsdf";
