import 'package:flutter/material.dart';

class ProductAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProductAddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFF2F2F2))),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined,
                size: 18, color: Color(0xFF6DC36E)),
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
      ),
    );
  }
}
