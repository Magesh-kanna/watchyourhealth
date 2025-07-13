import 'package:flutter/material.dart';

class AppointmentModel {
  final String title;
  final String imageiconurl;
  final String backgroundcolor;
  final String iconcolor;

  const AppointmentModel({
    required this.title,
    required this.imageiconurl,
    required this.backgroundcolor,
    required this.iconcolor,
  });

  AppointmentModel copyWith({
    String? title,
    String? imageiconurl,
    String? backgroundcolor,
    String? iconcolor,
  }) {
    return AppointmentModel(
      title: title ?? this.title,
      imageiconurl: imageiconurl ?? this.imageiconurl,
      backgroundcolor: backgroundcolor ?? this.backgroundcolor,
      iconcolor: iconcolor ?? this.iconcolor,
    );
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      title: json['title'],
      imageiconurl: json['imageiconurl'],
      backgroundcolor: json['backgroundcolor'],
      iconcolor: json['iconcolor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageiconurl': imageiconurl,
      'backgroundcolor': backgroundcolor,
      'iconcolor': iconcolor,
    };
  }

  /// UI helpers: parse hex string to Color
  Color get background => _hexToColor(backgroundcolor);

  Color get icon => _hexToColor(iconcolor);

  static Color _hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
