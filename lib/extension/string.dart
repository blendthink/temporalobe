extension StringExt on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
