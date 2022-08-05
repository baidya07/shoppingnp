extension DoubleExtension on double {
  String toStringWithDynamicFractionalDigits(int fractionalDigits) {
    if (floor() == toInt()) {
      return toStringAsFixed(0);
    } else {
      return toStringAsFixed(fractionalDigits);
    }
  }
}
