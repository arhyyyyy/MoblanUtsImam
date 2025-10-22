import 'package:flutter/material.dart';
import 'package:uts/theme/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('images/profil.png'),
            ),
            Positioned(
              bottom: 2,
              right: 4,
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Olivia Austin",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const Text(
          "oliviaaustin@gmail.com",
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}
