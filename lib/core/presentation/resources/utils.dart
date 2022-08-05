import 'dart:math';

class Utils {
  static int randomNumber() {
    return Random.secure().nextInt(500);
  }
}
