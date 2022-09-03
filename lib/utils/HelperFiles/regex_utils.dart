class RegexPatterns {
  static var emailRegex =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static var getOnlyIntegersRegX = RegExp(r'[^0-9]');
  static var removeUnnecessaryZeroRegX = RegExp(r'^0+(?=.)');
}
