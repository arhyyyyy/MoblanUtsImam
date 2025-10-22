import 'package:flutter/material.dart';
import 'package:uts/auth/widget/registrasi/registrasi_form.dart';
import 'package:uts/auth/widget/registrasi/registrasi_header.dart';
import 'package:uts/theme/colors.dart';

class RegistrasiPage extends StatelessWidget {
  const RegistrasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterHeader(),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
