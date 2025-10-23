import 'package:flutter/material.dart';
import 'package:uts/auth/forgot_password.dart';
import 'package:uts/theme/colors.dart';

class RememberMeRow extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool> onChanged;

  const RememberMeRow({
    super.key,
    required this.rememberMe,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.8,
              child: Switch(
                value: rememberMe,
                onChanged: onChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade300,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "Remember me",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
            );
          },
          child: Text(
            "Forgot password",
            style: TextStyle(
              color: AppColors.link,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
