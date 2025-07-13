import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchyourhealth/src/core/utils/app_colors.dart';

class TabTile extends StatelessWidget {
  final String title;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;

  const TabTile({
    super.key,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xFFF1F1F9),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: isSelected
                    ? AppColors.wakeYourHealthPrimary
                    : Colors.grey[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
