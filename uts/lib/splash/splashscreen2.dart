import 'package:flutter/material.dart';
import 'package:uts/splash/splashscreen.dart';
import 'package:uts/theme/colors.dart';

class SplashScreenDua extends StatefulWidget {
  const SplashScreenDua({super.key});

  @override
  State<SplashScreenDua> createState() => _SplashScreenDuaState();
}

class _SplashScreenDuaState extends State<SplashScreenDua> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> splashData = [
    {
      "image": "images/BuyGrocery.png",
      "title": "Buy Grocery",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur sadipscing elit, sed diam nonumy",
    },
    {
      "image": "images/FastDelivery.png",
      "title": "Fast Delivery",
      "desc":
          "Get your groceries delivered to your doorstep quickly and safely.",
    },
    {
      "image": "images/HealtyFood.png",
      "title": "Healty Food",
      "desc":
          "We ensure fresh and high-quality products for your daily needs.",
    },
  ];

  void _nextPage() {
    if (_currentIndex < splashData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen()),
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          splashData[index]['image']!,
                          height: 300,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          splashData[index]['title']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          splashData[index]['desc']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                splashData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: _currentIndex == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.primary
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _skip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      _currentIndex == splashData.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
