import 'package:flutter/material.dart';
import 'package:uts/auth/widget/welcome/welcome_button.dart';
import 'package:uts/auth/widget/welcome/welcome_footer.dart';
import 'package:uts/auth/widget/welcome/welcome_header.dart';
import 'package:uts/theme/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            WelcomeHeader(),
            WelcomeButtons(),
            WelcomeFooter(),
          ],
        ),
      ),
    );
  }
}
