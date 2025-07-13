import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    IconData? icon,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    // Hide any existing snackbar
    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.white, size: 20),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Colors.grey.shade800,
        duration: duration,
        behavior: behavior,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        action: actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                onPressed: onActionPressed ?? () {},
                textColor: textColor ?? Colors.white,
              )
            : null,
      ),
    );
  }

  // Success SnackBar
  static void showSuccess(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      icon: Icons.check_circle_outline,
      backgroundColor: Colors.green.shade600,
      iconColor: Colors.white,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  // Error SnackBar
  static void showError(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    show(
      context,
      message: message,
      icon: Icons.error_outline,
      backgroundColor: Colors.red.shade600,
      iconColor: Colors.white,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  // Warning SnackBar
  static void showWarning(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      icon: Icons.warning_amber,
      backgroundColor: Colors.orange.shade600,
      iconColor: Colors.white,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  // Info SnackBar
  static void showInfo(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      icon: Icons.info_outline,
      backgroundColor: Colors.blue.shade600,
      iconColor: Colors.white,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }
}
