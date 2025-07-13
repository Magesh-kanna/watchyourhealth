import 'package:flutter/material.dart';

class WatchYourHealthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double verticalPadding;
  final FontWeight fontWeight;
  final double borderRadius;
  final double elevation;
  final double? width;
  final double? height;
  final TextAlign textAlign;

  const WatchYourHealthButton({
    super.key,
    this.onPressed,
    required this.label,
    this.backgroundColor = const Color(0xFF255FD5),
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.verticalPadding = 18,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = 50,
    this.elevation = 0,
    this.width = double.infinity,
    this.height,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed ?? null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          elevation: elevation,
        ),
        child: Text(
          label,
          textAlign: textAlign,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
