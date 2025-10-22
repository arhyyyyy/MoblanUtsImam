import 'package:flutter/material.dart';
import 'package:uts/auth/login.dart';
import 'package:uts/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> splashData = [
    {
      'image': 'images/Splash.png',
      'title': 'Premium Food\nAt Your Doorstep',
      'subtitle':
          'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy.',
    },
    {
      'image': 'images/Splash2.png',
      'title': 'Buy Premium\nQuality Fruits',
      'subtitle':
          'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy.',
    },
    {
      'image': 'images/Splash3.png',
      'title': 'Fast Delivery\nTo Your Home',
      'subtitle':
          'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy.',
    },
    {
      'image': 'images/Splash4.png',
      'title': 'Fresh Vegetables\nEvery Morning',
      'subtitle':
          'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy.',
    },
  ];

  void _nextPage() {
    if (_currentPage < splashData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: splashData.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = splashData[index];
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: WhiteCurveClipper(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 90),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              children: [
                                Text(
                                  item['title']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  item['subtitle']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 350),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                height: 8,
                                width: _currentPage == index ? 18 : 8,
                                decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? const Color(0xFF56AB2F)
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 32, right: 32),
              child: GestureDetector(
                onTap: _nextPage,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primaryDark,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF56AB2F).withValues(alpha: .3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _currentPage == splashData.length - 1
                        ? "Get Started"
                        : "Get Started",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 80);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
