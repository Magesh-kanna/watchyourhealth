class Assessment {
  final int id;
  final String title;
  final String description;
  final String buttonText;
  final String splashImage;

  Assessment({
    required this.id,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.splashImage,
  });

  Assessment copyWith({
    int? id,
    String? title,
    String? description,
    String? buttonText,
    String? splashImage,
  }) {
    return Assessment(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      buttonText: buttonText ?? this.buttonText,
      splashImage: splashImage ?? this.splashImage,
    );
  }

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      buttonText: json['buttonText'],
      splashImage: json['splashImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'buttonText': buttonText,
      'splashImage': splashImage,
    };
  }
}
