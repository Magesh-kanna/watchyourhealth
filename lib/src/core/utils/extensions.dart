extension ImageSource on String {
  bool get isNetworkImage => startsWith('http');
}
