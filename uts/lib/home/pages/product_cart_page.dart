import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/data/providers/cart_provider.dart';
import 'package:uts/home/widget/produk/detail_product_page.dart';
import 'package:uts/home/widget/produk/favorite_button.dart';
import 'package:uts/home/widget/produk/product_add_button.dart';
import 'package:uts/home/widget/produk/product_badge.dart';
import 'package:uts/home/widget/produk/product_image.dart';
import 'package:uts/theme/colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) => DetailProductPage(product: product),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]!, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProductImage(product: product),
                  const SizedBox(height: 10),
                  Text(
                    product.price,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    product.unit,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  ProductAddButton(
                    product: product,
                    onAdd: () {
                      cartProvider.addToCart(
                        product.name,
                        product.price,
                        1,
                        product.image,
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 6,
              right: 8,
              child: FavoriteButton(product: product),
            ),
            Positioned(
              top: 6,
              left: 8,
              child: ProductBadge(
                isNew: product.isNew,
                discount: product.discount?.toInt(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
