import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  final String image;
  final Color? backgroundColor;

  const DetailHeader({
    super.key,
    required this.image,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: backgroundColor?.withValues(alpha: .2) ??
                const Color(0xFFE9FBE8),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(120),
              bottomRight: Radius.circular(120),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 15,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Image.asset(
            image,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
