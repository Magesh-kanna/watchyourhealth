import 'package:flutter/material.dart';

class CircularArrowButton extends StatelessWidget {
  const CircularArrowButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF1F2954), // Dark navy blue
        ),
        child: const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
      ),
    );
  }
}
