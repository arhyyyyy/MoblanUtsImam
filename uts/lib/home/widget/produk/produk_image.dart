import 'package:flutter/material.dart';
import 'package:uts/theme/colors.dart';

class ProductImage extends StatelessWidget {
  final String title;
  final String imagePath;

  const ProductImage({
    super.key,
    required this.title,
    required this.imagePath,
  });

  Color _getCircleColor(String title) {
    switch (title.toLowerCase()) {
      case 'fresh peach':
        return Colors.orangeAccent;
      case 'avocado':
        return const Color(0xFF6DC36E);
      case 'lemon':
        return const Color.fromARGB(255, 77, 184, 79);
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: _getCircleColor(title).withValues(alpha: .2),
            shape: BoxShape.circle,
          ),
        ),
        Image.asset(
          imagePath,
          height: 80,
          fit: BoxFit.contain,
        ),
        Positioned(
          top: 0,
          right: -25,
          child: Icon(
            Icons.favorite_border,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
