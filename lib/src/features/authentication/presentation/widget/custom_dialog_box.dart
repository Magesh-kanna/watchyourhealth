import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final Color? primaryButtonColor;
  final Color? titleColor;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.primaryButtonText = 'OK',
    this.secondaryButtonText,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.primaryButtonColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon (if provided)
            if (icon != null) ...[
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: iconBackgroundColor ?? Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: iconColor ?? Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Title
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: titleColor ?? Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 12),

            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                // Secondary Button (if provided)
                if (secondaryButtonText != null) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onSecondaryPressed?.call();
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(secondaryButtonText!),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],

                // Primary Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onPrimaryPressed?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          primaryButtonColor ?? Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(primaryButtonText!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
