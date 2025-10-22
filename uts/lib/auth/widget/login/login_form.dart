import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uts/auth/registrasi.dart';
import 'package:uts/auth/widget/email_field.dart';
import 'package:uts/auth/widget/login/remember_me.dart';
import 'package:uts/auth/widget/password_filed.dart';
import 'package:uts/home/pages/home.page.dart';
import 'package:uts/theme/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome back !",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Sign in to your account",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 25),
          const EmailField(),
          const SizedBox(height: 15),
          const PasswordField(),
          const SizedBox(height: 10),
          RememberMeRow(
            rememberMe: _rememberMe,
            onChanged: (val) => setState(() => _rememberMe = val),
          ),
          const SizedBox(height: 20),
          _buildLoginButton(context),
          const SizedBox(height: 20),
          _buildSignUpText(context),
        ],
      ),
    );
  }
  Widget _buildLoginButton(BuildContext context) {
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
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSignUpText(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(color: Colors.black54),
          children: [
            TextSpan(
              text: "Sign up",
              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrasiPage(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
