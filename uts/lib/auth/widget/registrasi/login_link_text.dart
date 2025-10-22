import 'package:flutter/material.dart';
import 'package:uts/auth/login.dart';
import 'package:uts/auth/widget/login/login_form.dart';
import 'package:uts/theme/colors.dart';
import 'package:flutter/gestures.dart';

class LoginLinkText extends StatelessWidget {
  const LoginLinkText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
