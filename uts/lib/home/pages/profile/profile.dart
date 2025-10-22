import 'package:flutter/material.dart';
import 'package:uts/home/widget/HomeWidget/home_button.dart';
import 'package:uts/home/widget/profile/profile_header.dart';
import 'package:uts/home/widget/profile/profile_menu.dart';
import 'package:uts/theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 20),
            ProfileHeader(),
            SizedBox(height: 30),
            Expanded(child: ProfileMenuList()),
          ],
        ),
      ),
      // Gunakan widget floating button dari file terpisah
      bottomNavigationBar: const FloatingCartButton(),
    );
  }
}
