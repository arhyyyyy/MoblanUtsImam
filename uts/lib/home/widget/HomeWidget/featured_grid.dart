import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/data/models/product_data.dart';
import 'package:uts/data/providers/cart_provider.dart';
import 'package:uts/home/pages/product_cart_page.dart';

class FeaturedGrid extends StatelessWidget {
  final String? category;

  const FeaturedGrid({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final products = category != null
        ? ProductData.getProductsByCategory(category!)
        : ProductData.allProducts;

    if (products.isEmpty) {
      return const Center(
        child: Text(
          "No products found",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return ProductCard(
          product: product,
          onAdd: () {
            cartProvider.addToCart(
              product.name,
              product.price,
              1,
              product.image,
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${product.name} added to cart'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      },
    );
  }
}
