import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CategoryItem(icon: Icons.eco, title: "Vegetables", color: Colors.green),
          CategoryItem(icon: Icons.apple, title: "Fruits", color: Colors.redAccent),
          CategoryItem(icon: Icons.local_cafe, title: "Beverages", color: Colors.orange),
          CategoryItem(icon: Icons.inventory, title: "Grocery", color: Colors.blue),
          CategoryItem(icon: Icons.cookie, title: "Edible oil", color: Colors.purple),
          CategoryItem(icon: Icons.home, title: "Household", color: Colors.teal),
        ],
      ),
    );
  }
}
