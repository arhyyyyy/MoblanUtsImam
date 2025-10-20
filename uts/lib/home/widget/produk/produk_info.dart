import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String price;
  final String unit;

  const ProductInfo({
    super.key,
    required this.title,
    required this.price,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          price,
          style: const TextStyle(
            color: Color(0xFF6DC36E),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          unit,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
