import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFFF47521).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFF47521).withOpacity(opacity);
    }
  }

  static const Color scaffoldBackgroundColor = Color(0xFFF8F8F9);

  static const Color colorSchemeSecondary = Color(0xFF7C529D);

  static const Color fontColor = Color(0xFF646E77);
  static const Color dividerColor = Color(0xFFE9EDF0);

  static Color secondaryColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFF000000).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF000000).withOpacity(opacity);
    }
  }


  static Color secondaryLightColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFF525252).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF525252).withOpacity(opacity);
    }
  }

  static Color primaryDarkColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFF059B4A);
    } catch (e) {
      return const Color(0xFF059B4A).withOpacity(opacity);
    }
  }






  static Color scaffoldColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFFF8F8F8).withOpacity(0.97);
    } catch (e) {
      return const Color(0xFFF8F8F8).withOpacity(0.97);
    }
  }

  static Color colorBlack(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return  Colors.black.withOpacity(opacity);
    } catch (e) {
      return  Colors.black.withOpacity(opacity);
    }
  }
  static Color colorWhite(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return  Colors.white.withOpacity(opacity);
    } catch (e) {
      return  Colors.white.withOpacity(opacity);
    }
  }

  static Color backgroundColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFFFFFFFF);
    } catch (e) {
      return const Color(0xFFFFFFFF).withOpacity(opacity);
    }
  }

  //other colors
  static Color amber = const Color(0xFFF6B500);
  static Color grey1=const Color(0xffF6F6F6);

// LinearGradient buttonGradient =  LinearGradient(
//   begin: Alignment(0.96, 0.0),
//   end: Alignment(-0.95, 0.0),
//   colors: [Color(0xff006fc4), Color(0xff428cee)],
//   stops: [0.0, 1.0],
// );
}

final primaryColor = const Color(0xFFF47521);
final primaryColorDark = const Color(0xFF01B051);
final primaryColorLight = const Color(0x6601B051);
final secondaryColor = const Color(0x6601B051);
final scaffoldBgColor = const Color(0xFFF8F8F8); //#E5E5E5
// final secondaryColor = Color(0xFFFB8C00);
// final secondaryColorDark = Color(0xFFFB8C00);
final secondaryColorDark = const Color(0x6601B051);
final disabledColor = Colors.grey[400];
const dividerColor = Colors.grey;


// Hex Opacity Values
//
// 100% — FF
// 95% — F2
// 90% — E6
// 85% — D9
// 80% — CC
// 75% — BF
// 70% — B3
// 65% — A6
// 60% — 99
// 55% — 8C
// 50% — 80
// 45% — 73
// 40% — 66
// 35% — 59
// 30% — 4D
// 25% — 40
// 20% — 33
// 15% — 26
// 10% — 1A
// 5% — 0D
// 0% — 00
