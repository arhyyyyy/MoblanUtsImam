
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uts/data/favorite_manager.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/home/widget/HomeWidget/home.page.dart';
import 'package:uts/theme/colors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductModel> favorites = [];

  @override
  void initState() {
    super.initState();
    favorites = FavoriteManager.favorites;
  }

  void _removeFavorite(ProductModel product) {
    setState(() {
      FavoriteManager.toggleFavorite(product);
      favorites = FavoriteManager.favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
             MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
          },
        ),
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final product = favorites[index];
                return Dismissible(
                  key: Key(product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => _removeFavorite(product),
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withValues(alpha: .05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              product.backgroundColor?.withValues(alpha: .2),
                          backgroundImage: AssetImage(product.image),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${product.price} x 4",
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product.unit,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: const [
                            Icon(Icons.add, color: AppColors.primary),
                            SizedBox(height: 4),
                            Text("5"),
                            SizedBox(height: 4),
                            Icon(Icons.remove, color: AppColors.primary),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: favorites.length,
            ),
    );
  }
}
