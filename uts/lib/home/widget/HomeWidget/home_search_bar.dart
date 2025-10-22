import 'package:flutter/material.dart';
import 'package:uts/home/pages/search_page.dart';
import 'package:uts/home/pages/filter_page.dart'; // <--- tambahkan
import 'package:uts/theme/colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchPage()),
                );
              },
              child: const Text(
                'Search keywords...',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FilterPage()),
              );
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.tune,
                color: Color(0xFF808080),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
