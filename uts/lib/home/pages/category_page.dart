import 'package:flutter/material.dart';
import 'package:uts/home/widget/HomeWidget/featured_grid.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.eco, 'title': 'Vegetables', 'color': Colors.green},
      {'icon': Icons.apple, 'title': 'Fruits', 'color': Colors.redAccent},
      {'icon': Icons.local_cafe, 'title': 'Beverages', 'color': Colors.orange},
      {'icon': Icons.inventory, 'title': 'Grocery', 'color': Colors.blue},
      {'icon': Icons.cookie, 'title': 'Edible oil', 'color': Colors.purple},
      {'icon': Icons.home, 'title': 'Household', 'color': Colors.teal},
      {'icon': Icons.child_care, 'title': 'Babycare', 'color': Colors.lightBlue},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Categories',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            return GestureDetector(
              onTap: () {
                // buka FeaturedGrid sesuai kategori
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
                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(16),
                        child: FeaturedGrid(category: item['title']),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: item['color'].withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item['icon'],
                        color: item['color'],
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 10),
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
          },
        ),
      ),
    );
  }
}
