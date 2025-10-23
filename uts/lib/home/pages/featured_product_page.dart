import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/data/models/product_data.dart';
import 'package:uts/data/providers/cart_provider.dart';
import 'package:uts/home/pages/home.page.dart';
import 'package:uts/home/pages/product_cart_page.dart';
import 'package:uts/home/widget/produk/detail_product_page.dart';

class FeaturedProductPage extends StatefulWidget {
  const FeaturedProductPage({super.key});

  @override
  State<FeaturedProductPage> createState() => _FeaturedProductPageState();
}

class _FeaturedProductPageState extends State<FeaturedProductPage> {
  late List<ProductModel> featuredProducts;

  @override
  void initState() {
    super.initState();
    featuredProducts = _getFeaturedProducts();
  }

  List<ProductModel> _getFeaturedProducts() {
    final fruits = ProductData.getProductsByCategory('Fruits');
    final vegetables = ProductData.getProductsByCategory('Vegetables');
    final beverages = ProductData.getProductsByCategory('Beverages');
    final babycare = ProductData.getProductsByCategory('Babycare');

    return [
      fruits[0],
      fruits[2],
      vegetables[1],
      vegetables[3],
      beverages[0],
      babycare[1],
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Featured Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: GridView.builder(
          itemCount: featuredProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final product = featuredProducts[index];
            return ProductCard(
              product: product,
              onAdd: () {
                cartProvider.addToCart(
                  product.name,
                  product.price,
                  1,
                  product.image,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
