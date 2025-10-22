import 'package:flutter/material.dart';
import 'package:uts/theme/colors.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundAlt,
        prefixIcon: const Icon(Icons.phone_outlined),
        labelText: "Phone number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
