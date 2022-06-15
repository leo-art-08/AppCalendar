import 'package:calendarappnew/models/Product.dart';
import 'package:flutter/material.dart';

class DetScreenn extends StatelessWidget {
  final Product product;

  const DetScreenn({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
    );
  }
}
