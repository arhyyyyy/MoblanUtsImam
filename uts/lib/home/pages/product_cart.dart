import 'package:flutter/material.dart';
import 'package:uts/cart/pages/shopping_cart_page.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/home/pages/detail_product_page.dart';
import 'package:uts/home/widget/produk/produk_add_button.dart';
import 'package:uts/theme/colors.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final List<Map<String, dynamic>> cartItems;

  const ProductCard({
    super.key,
    required this.product,
    required this.cartItems,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final cartItems = widget.cartItems;

    return GestureDetector(
      // Gunakan GestureDetector agar bisa deteksi tap di child tanpa overlap
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
          border: Border.all(color: Colors.grey[200]!, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // Lingkaran background
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: (product.backgroundColor ??
                                _getCircleColor(product.name))
                            .withValues(alpha: .3),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Gambar produk
                    Image.asset(product.image,
                        height: 80, fit: BoxFit.contain),

                    // Tombol Favorite
                    Positioned(
                      top: -5,
                      right: -40,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            setState(() => isFavorite = !isFavorite);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  isFavorite ? Colors.red : Colors.grey[400],
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  product.price,
                  style: const TextStyle(
                    color: Color(0xFF6DC36E),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  product.unit,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 15),
                ProductAddButton(
                  onPressed: () {
                    cartItems.add({
                      "id": product.id,
                      "name": product.name,
                      "weight": product.unit,
                      "price": double.tryParse(
                              product.price.replaceAll("\$", "")) ??
                          0,
                      "image": product.image,
                      "circleColor": product.backgroundColor ??
                          _getCircleColor(product.name),
                      "quantity": 1,
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ShoppingCartPage(cartItems: cartItems),
                      ),
                    );
                  },
                ),
              ],
            ),
            if (product.isNew)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: const Color.fromARGB(255, 253, 244, 213),
                  child: const Text(
                    "NEW",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
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