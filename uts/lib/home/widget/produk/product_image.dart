import 'package:flutter/material.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/theme/colors.dart';

class ProductImage extends StatelessWidget {
  final ProductModel product;
  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: (product.backgroundColor ?? _getCircleColor(product.name))
                .withValues(alpha: .25),
            shape: BoxShape.circle,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Image.asset(
              product.image,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Color _getCircleColor(String title) {
    switch (title.toLowerCase()) {
      case 'fresh peach':
        return Colors.orangeAccent;
      case 'avocado':
        return const Color(0xFF6DC36E);
      case 'lemon':
        return const Color.fromARGB(255, 77, 184, 79);
      case 'apple':
        return Colors.redAccent;
      default:
        return AppColors.primary;
    }
  }
}