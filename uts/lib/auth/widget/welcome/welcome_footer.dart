import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uts/auth/login.dart'; // sesuaikan nama file login page kamu
import 'package:uts/theme/colors.dart';

class WelcomeFooter extends StatelessWidget {
  const WelcomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(color: Colors.black54),
          children: [
            TextSpan(
              text: "Login",
              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
