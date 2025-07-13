extension ImageSource on String? {
  bool get isNetworkImage => (this ?? '').startsWith('http');

  /// Returns true when value is not null or zero
  bool get isNotNullOrEmpty {
    return this != null && this!.trim().isNotEmpty;
  }

  /// Returns true when value is not null or zero
  bool get isNullOrEmpty {
    return this == null || this!.trim().isEmpty;
  }

  /// Extracts name from email
  String extractNameFromEmail() {
    final namePart = (this ?? '').split('@').first;
    if (namePart.isEmpty) return 'No email';

    return 'Hello ${namePart[0].toUpperCase() + namePart.substring(1)}';
  }
}
