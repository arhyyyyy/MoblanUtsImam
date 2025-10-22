import 'package:flutter/material.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/data/models/product_data.dart';
import 'package:uts/home/pages/product_cart.dart';

class FeaturedGrid extends StatefulWidget {
  final String? category;

  const FeaturedGrid({super.key, this.category});

  @override
  State<FeaturedGrid> createState() => _FeaturedGridState();
}

class _FeaturedGridState extends State<FeaturedGrid> {
  final List<Map<String, dynamic>> cartItems = [];
  late final List<ProductModel> products;

  @override
  void initState() {
    super.initState();
    products = widget.category != null
        ? ProductData.getProductsByCategory(widget.category!)
        : ProductData.allProducts;
  }

  @override
  Widget build(BuildContext context) {
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
          cartItems: cartItems,
        );
      },
    );
  }
}
