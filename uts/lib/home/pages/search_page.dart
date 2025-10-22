import 'package:flutter/material.dart';
import 'package:uts/theme/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final history = [
      'Fresh Grocery',
      'Bananas',
      'cheetos',
      'vegetables',
      'Fruits',
      'discounted items',
      'Fresh vegetables',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search keywords..',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.tune, color: Colors.grey),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Search History"),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: history
                  .map((item) => _buildTag(item))
                  .toList(),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader("Discover more"),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: history
                  .map((item) => _buildTag(item))
                  .toList(),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: _bottomButton(Icons.image_outlined, "Image Search"),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _bottomButton(Icons.mic_none, "Voice Search"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const Text(
          "clear",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(label, style: const TextStyle(color: Colors.black87)),
    );
  }

  Widget _bottomButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
