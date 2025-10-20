import 'package:flutter/material.dart';

class ProductAddButton extends StatelessWidget {
  const ProductAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFF2F2F2)),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.shopping_bag_outlined,
            size: 18,
            color: Color(0xFF6DC36E),
          ),
          SizedBox(width: 6),
          Text(
            "Add to cart",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
