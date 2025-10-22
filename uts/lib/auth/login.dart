import 'package:flutter/material.dart';
import 'package:uts/auth/widget/login/login_form.dart';
import 'package:uts/auth/widget/login/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
