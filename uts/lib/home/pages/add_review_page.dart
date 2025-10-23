import 'package:flutter/material.dart';
import 'package:uts/home/pages/home.page.dart';
import 'package:uts/theme/colors.dart';

class TambahReviewPage extends StatefulWidget {
  const TambahReviewPage({super.key});

  @override
  State<TambahReviewPage> createState() => _TambahReviewPageState();
}

class _TambahReviewPageState extends State<TambahReviewPage> {
  double rating = 0.0;
  final TextEditingController _controller = TextEditingController();

  void _onStarTap(int index) {
    setState(() {
      rating = index.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stars = List.generate(5, (index) {
      final starIndex = index + 1;
      return GestureDetector(
        onTap: () => _onStarTap(starIndex),
        child: Icon(
          starIndex <= rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 40,
        ),
      );
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text("Write Reviews"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "What do you think ?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "please give your rating by clicking on the stars below",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: stars,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: TextField(
                controller: _controller,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tell us about your experience",
                  prefixIcon: Icon(Icons.edit_outlined, color: Colors.grey),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              },
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Start shopping",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
