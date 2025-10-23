import 'package:flutter/material.dart';

class ProductBadge extends StatelessWidget {
  final bool isNew;
  final int? discount;

  const ProductBadge({
    super.key,
    this.isNew = false,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    if (!isNew && discount == null) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isNew)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: const Text(
              "NEW",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        if (discount != null)
          Container(
            margin: EdgeInsets.only(top: isNew ? 4 : 0),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Text(
              "-$discount%",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}