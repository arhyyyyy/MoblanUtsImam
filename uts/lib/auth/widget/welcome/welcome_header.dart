import 'package:flutter/material.dart';
import 'package:uts/home/pages/favorit/favorite.dart';
import 'package:uts/splash/splashscreen2.dart';
import 'package:uts/theme/colors.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          'images/login.png',
          height: 520,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreenDua(),
                    ),
                  );
                  },
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ),
                const Spacer(),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
