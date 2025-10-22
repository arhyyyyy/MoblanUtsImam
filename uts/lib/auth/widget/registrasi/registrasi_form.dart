import 'package:flutter/material.dart';
import 'package:uts/auth/widget/email_field.dart';
import 'package:uts/auth/widget/password_filed.dart';
import 'package:uts/auth/widget/registrasi/login_link_text.dart';
import 'package:uts/auth/widget/registrasi/phone_field.dart';
import 'package:uts/home/pages/home.page.dart';
import 'package:uts/theme/colors.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create account",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Quickly create account",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 25),
          const EmailField(),
          const SizedBox(height: 15),
          const PhoneField(),
          const SizedBox(height: 15),
          const PasswordField(),
          const SizedBox(height: 25),
          _buildSignupButton(context),
          const SizedBox(height: 20),
          const LoginLinkText(),
        ],
      ),
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Signup",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
