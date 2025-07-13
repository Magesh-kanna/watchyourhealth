import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final TextStyle? messageStyle;

  const EmptyState({
    super.key,
    this.message = 'No data available',
    this.icon = Icons.inbox,
    this.iconSize = 80,
    this.iconColor,
    this.messageStyle,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        iconColor ?? Theme.of(context).colorScheme.primary.withOpacity(0.5);
    final textStyle =
        messageStyle ?? TextStyle(fontSize: 16, color: Colors.grey[600]);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: color),
          const SizedBox(height: 16),
          Text(message, style: textStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
