import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String get displayThemeName {
    switch (this) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}
