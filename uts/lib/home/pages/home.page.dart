import 'package:flutter/material.dart';
import 'package:uts/home/pages/category_page.dart';
import 'package:uts/home/widget/category/category_list.dart';
import 'package:uts/home/widget/HomeWidget/featured_grid.dart';
import 'package:uts/home/widget/HomeWidget/floating_cart_button.dart';
import 'package:uts/home/widget/HomeWidget/home_banner.dart';
import 'package:uts/home/widget/HomeWidget/home_search_bar.dart';
import 'package:uts/home/widget/HomeWidget/home_section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            const HomeSearchBar(),
            const SizedBox(height: 10),
            const HomeBanner(),
            const SizedBox(height: 25),
            HomeSectionTitle(
              title: 'Categories',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CategoryPage()),
                );
              },
            ),
            const SizedBox(height: 15),
            const CategoryList(),
            const SizedBox(height: 30),
            const HomeSectionTitle(title: 'Featured Products'),
            const SizedBox(height: 15),
            const FeaturedGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const FloatingCartButton(),
    );
  }
}
