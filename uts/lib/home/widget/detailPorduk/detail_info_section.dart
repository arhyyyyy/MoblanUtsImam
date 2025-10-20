import 'package:flutter/material.dart';
import 'package:uts/theme/colors.dart';

class DetailInfoSection extends StatelessWidget {
  final String nama;
  final String harga;
  final String deskripsi;
  final double rating;
  final int ulasan;

  const DetailInfoSection({
    super.key,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.rating,
    required this.ulasan,
  });

  List<Widget> _buildStars(double rating) {
    final List<Widget> stars = [];
    final int fullStars = rating.floor();
    final bool hasHalfStar = rating - fullStars >= 0.5;

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber, size: 18));
    }
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 18));
    }
    while (stars.length < 5) {
      stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 18));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          harga,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          nama,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Row(children: _buildStars(rating)),
            const SizedBox(width: 6),
            Text(
              "$rating ($ulasan reviews)",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          deskripsi,
          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),
      ],
    );
  }
}
