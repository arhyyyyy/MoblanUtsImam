import 'package:flutter/material.dart';
import 'package:uts/home/pages/add_review_page.dart';
import 'package:uts/theme/colors.dart';
import 'package:uts/theme/theme.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<Map<String, dynamic>> reviews = [
      {
        "name": "Arhy",
        "image": "images/profil.png",
        "rating": 4.5,
        "time": "32 minutes ago",
      },
      {
        "name": "Akbar",
        "image": "images/akbar.png",
        "rating": 4.5,
        "time": "32 minutes ago",
      },
      {
        "name": "Pato",
        "image": "images/pato.png",
        "rating": 4.5,
        "time": "32 minutes ago",
      },
      {
        "name": "Ahmad",
        "image": "images/orang.png",
        "rating": 4.5,
        "time": "32 minutes ago",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text("Reviews"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const TambahReviewPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .03),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Header (foto & nama)
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(review['image']),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review['name'],
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          review['time'],
                          style: textTheme.labelLarge!.copyWith(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(color: AppColors.border, thickness: 1, height: 1),
                const SizedBox(height: 8),

                // --- Rating
                Row(
                  children: [
                    Text(
                      "${review['rating']}",
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Row(children: _buildStars(review['rating'])),
                  ],
                ),

                const SizedBox(height: 8),

                // --- Deskripsi
                Text(
                  "Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy",
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.textGrey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

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
}
