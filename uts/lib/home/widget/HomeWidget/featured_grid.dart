import 'package:flutter/material.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/home/pages/product_cart.dart';

class FeaturedGrid extends StatelessWidget {
  const FeaturedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Daftar produk menggunakan ProductModel
    final List<ProductModel> products = [
      ProductModel(
        id: "1",
        name: "Fresh Peach",
        price: "\$8.00",
        unit: "dozen",
        image: "images/Peach.png",
        description:
            "Sweet and juicy fresh peaches, perfect for a healthy breakfast or snack.",
        isNew: false,
      ),
      ProductModel(
        id: "2",
        name: "Avocado",
        price: "\$7.00",
        unit: "2.0 lbs",
        image: "images/Alvokat.png",
        description:
            "Rich, creamy avocados filled with nutrients — ideal for smoothies or salads.",
        isNew: true,
      ),
      ProductModel(
        id: "3",
        name: "Organic Lemons",
        price: "\$2.22",
        unit: "1.50 lbs",
        image: "images/Lemon.png",
        description:
            "Fresh organic lemons, great for cooking, juicing, or refreshing drinks.",
        isNew: true,
      ),
    ];

    // 🔹 Menampilkan grid produk
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
        return ProductCard(product: product);
      },
    );
  }
}
