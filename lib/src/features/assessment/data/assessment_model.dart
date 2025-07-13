import 'package:cloud_firestore/cloud_firestore.dart';

class Assessment {
  final String id;
  final String title;
  final String description;
  final String duration;
  final String buttonText;
  final String splashImage;

  Assessment({
    required this.id,
    required this.title,
    required this.duration,
    required this.description,
    required this.buttonText,
    required this.splashImage,
  });

  Assessment copyWith({
    String? id,
    String? title,
    String? description,
    String? duration,
    String? buttonText,
    String? splashImage,
  }) {
    return Assessment(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      buttonText: buttonText ?? this.buttonText,
      splashImage: splashImage ?? this.splashImage,
    );
  }

  factory Assessment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Assessment(
      id: doc.id,
      title: data['title'] ?? '',
      duration: data['duration'] ?? '',
      description: data['description'] ?? '',
      buttonText: data['buttonText'] ?? '',
      splashImage: data['splashImage'] ?? '',
    );
  }

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      duration: json['duration'] ?? '',
      description: json['description'] ?? '',
      buttonText: json['buttonText'] ?? '',
      splashImage: json['splashImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'description': description,
      'buttonText': buttonText,
      'splashImage': splashImage,
    };
  }
}
