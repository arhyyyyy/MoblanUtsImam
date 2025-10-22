import 'package:flutter/material.dart';
import 'package:uts/data/models/category.dart';
import 'package:uts/home/widget/HomeWidget/featured_grid.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(
                      title: Text(item['title']),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      iconTheme: const IconThemeData(color: Colors.black),
                      titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(16),
                      child: FeaturedGrid(category: item['title']),
                    ),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: item['color'].withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: item['icon'](item['color']),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
