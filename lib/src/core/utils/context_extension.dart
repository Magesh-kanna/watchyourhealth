import 'dart:math';

import 'package:flutter/material.dart';

extension RandomShadeColor on BuildContext {
  /// Returns a random soft pastel-like color
  Color get randomShadeColor {
    final random = Random();

    // Pastel base range: high RGB values with lower saturation
    int r = 150 + random.nextInt(106); // 150–255
    int g = 150 + random.nextInt(106);
    int b = 150 + random.nextInt(106);

    return Color.fromARGB(255, r, g, b);
  }
}
