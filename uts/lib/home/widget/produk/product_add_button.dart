import 'package:flutter/material.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/theme/colors.dart';

class ProductAddButton extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onAdd;

  const ProductAddButton({
    super.key,
    required this.product,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: AppColors.border.withValues(alpha: .6),
          thickness: 1,
          height: 20,
        ),
        InkWell(
          onTap: () {
            // Jalankan aksi tambah
            if (onAdd != null) onAdd!();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${product.name} added to cart",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.primaryDark,
              ),
            );
          },
          borderRadius: BorderRadius.circular(10),
          splashColor: AppColors.primaryLight.withValues(alpha: .4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.primaryDark,
                  size: 18,
                ),
                SizedBox(width: 6),
                Text(
                  "Add to cart",
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
