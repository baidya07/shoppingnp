import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme() {

  final textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: primaryColorDark,
    ),
    headline4: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: primaryColorDark,
    ),  headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: primaryColorDark,
    ),
    headline6: const TextStyle(
      fontSize: 18,
    ),

    bodyText1: const TextStyle(
      fontSize: 15,
      height: 1.5,
      fontWeight: FontWeight.normal
    ),
    bodyText2: const TextStyle(
      fontSize: 14,
    ),
  );

  final inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    // fillColor: Color(0XFFF0F0F0),
    filled: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(5)),
    alignLabelWithHint: true,
  );
  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: primaryColor),
    buttonColor: primaryColor,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    // highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disabledColor,
    scaffoldBackgroundColor: scaffoldBgColor,
    fontFamily: 'Roboto',
    dividerColor: dividerColor,
    // appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(
    //   systemNavigationBarColor: primaryColor, // Navigation bar
    //   statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.light,
    //     statusBarBrightness: Brightness.light
    //   // Status bar
    // )),
    textTheme: textTheme,
    // textButtonTheme: TextButtonThemeData(style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.all(primaryColor),
    //   foregroundColor: MaterialStateProperty.all(primaryColor),
    //   overlayColor: MaterialStateProperty.all(primaryColor),
    //
    // )),
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
          colorScheme: ColorScheme(

        primary: primaryColor, onPrimary: Colors.white, background: Colors.white, error: Colors.red, onSecondary: Colors.white, onError: Colors.red, surface: Colors.white, secondary: secondaryColor, onSurface: Colors.black, onBackground: Colors.white, brightness: Brightness.light
            ,),
    iconTheme: IconThemeData(color: primaryColor),
    appBarTheme: AppBarTheme(color: primaryColor,titleTextStyle: textTheme.bodyText1, iconTheme: const IconThemeData(color: Colors.white,size: 20), actionsIconTheme:  const IconThemeData(color: Colors.black,opacity: 0.7, size: 28)),

  );
}

// class AppTheme {
//   const AppTheme();
//   static ThemeData lightTheme = ThemeData(
//     primarySwatch: Colors.blue,
//     backgroundColor: LightColor.background,
//     primaryColor: LightColor.purple,
//     accentColor: LightColor.lightblack,
//     primaryColorDark: LightColor.Darker,
//     primaryColorLight: LightColor.brighter,
//     cardTheme: CardTheme(color: LightColor.background),
//     textTheme: ThemeData.light().textTheme,
//     iconTheme: IconThemeData(color: LightColor.lightblack),
//     bottomAppBarColor: LightColor.background,
//     dividerColor: LightColor.lightGrey,
//     disabledColor: LightColor.darkgrey,
//     colorScheme: ColorScheme(
//         primary: LightColor.purple,
//         primaryVariant: LightColor.purple,
//         secondary: LightColor.lightBlue,
//         secondaryVariant: LightColor.darkBlue,
//         surface: LightColor.background,
//         background: LightColor.background,
//         error: Colors.red,
//         onPrimary: LightColor.Darker,
//         onSecondary: LightColor.background,
//         onSurface: LightColor.Darker,
//         onBackground: LightColor.titleTextColor,
//         onError: LightColor.titleTextColor,
//         brightness: Brightness.dark),
//   );
//   static ThemeData darkTheme = ThemeData(
//     primarySwatch: Colors.blue,
//     backgroundColor: DarkColor.background,
//     primaryColor: DarkColor.purple,
//     accentColor: DarkColor.lightblack,
//     primaryColorDark: DarkColor.Darker,
//     primaryColorLight: DarkColor.brighter,
//     cardTheme: CardTheme(color: DarkColor.background),
//     textTheme: ThemeData.dark()
//         .textTheme
//         .copyWith(bodyText1: TextStyle(color: DarkColor.titleTextColor)),
//     iconTheme: IconThemeData(color: DarkColor.lightblack),
//     bottomAppBarColor: DarkColor.lightblack,
//     dividerColor: LightColor.subTitleTextColor,
//     colorScheme: ColorScheme(
//         primary: DarkColor.purple,
//         primaryVariant: DarkColor.purple,
//         secondary: DarkColor.lightBlue,
//         secondaryVariant: DarkColor.darkBlue,
//         surface: DarkColor.background,
//         background: DarkColor.background,
//         error: Colors.red,
//         onPrimary: DarkColor.white,
//         onSecondary: DarkColor.Darker,
//         onSurface: DarkColor.white,
//         onBackground: DarkColor.titleTextColor,
//         onError: DarkColor.titleTextColor,
//         brightness: Brightness.dark),
//   );
//
//   static TextStyle titleStyle =
//   const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
//   static TextStyle subTitleStyle =
//   const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);
//
//   static TextStyle h1Style =
//   const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
//   static TextStyle h2Style = const TextStyle(fontSize: 22);
//   static TextStyle h3Style = const TextStyle(fontSize: 20);
//   static TextStyle h4Style = const TextStyle(fontSize: 18);
//   static TextStyle h5Style = const TextStyle(fontSize: 16);
//   static TextStyle h6Style = const TextStyle(fontSize: 14);
// }
