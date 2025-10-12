class DefaultStrings {
  static final DefaultStrings instance = DefaultStrings._();
  DefaultStrings._();

  String get(String key, {required String fallback}) {
    return fallback;
  }
}
