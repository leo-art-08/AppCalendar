import 'package:calendarappnew/models/Product.dart';
import 'package:flutter/material.dart';

class ItemCrard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const ItemCrard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            height: 250,
            width: 180,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(product.image),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0 / 4),
          child: Text(
            product.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
