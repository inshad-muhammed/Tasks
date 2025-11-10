import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.transparent,
  focusColor: const Color(0xff446193),
  cardColor: Colors.white,
  disabledColor: Color(0xffF5FBFF),
  highlightColor: Color(0xff4197CB),
  hintColor: Colors.white,
  hoverColor: Colors.grey.shade300,
  shadowColor: Color(0xffF5FBFF),
  splashColor: const Color(0xff0D3E7F),
  ///////
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xff212132),
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    outline: Color(0xffDFE4EA),
    outlineVariant: Colors.grey,
    primaryContainer: Color(0xff16074C),
    secondaryContainer: Color(0xff106EB2),
    tertiaryContainer: Color(0xff16074C),
    onTertiaryContainer: Color(0xff106EB2),
    error: Color(0xffC65851),
    onSecondaryContainer: Colors.grey.shade200,
    onPrimaryContainer: Colors.grey.shade300,
    inversePrimary: Colors.grey.shade100,
    surfaceContainerHigh: const Color.fromARGB(255, 184, 220, 236),
    inverseSurface: Colors.lightBlue.shade50,
  ),
  /////
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      // fontSize: SizeConfig.screenWidth * 0.02,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      // fontSize: SizeConfig.screenWidth * 0.02,
    ),
  ),
  ////
  appBarTheme: AppBarThemeData(
    titleTextStyle: TextStyle(
      color: const Color(0xff0D3E7F),

      fontWeight: FontWeight.w900,
    ),
    actionsIconTheme: IconThemeData(color: const Color(0xff446193)),
  ),
);

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  canvasColor: Colors.transparent,
  focusColor: Colors.white,
  cardColor: Colors.black87,
  cardTheme: CardThemeData(shape: Border.all(color: Color(0xff4197CB))),
  disabledColor: Colors.black54,
  highlightColor: Colors.white,
  hintColor: Colors.black,
  hoverColor: Colors.black54,
  shadowColor: Colors.black26,
  splashColor: Colors.blueAccent,

  /////
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xff212132),
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.black,
    outline: Color(0xff677379),
    outlineVariant: Colors.grey.shade500,
    primaryContainer: Color(0xff16074C),
    secondaryContainer: Color(0xff106EB2),
    tertiaryContainer: Colors.white,
    onTertiaryContainer: Colors.white,
    error: Colors.white,
    onSecondaryContainer: Colors.grey.shade900,
    onPrimaryContainer: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade600,
    surfaceContainerHigh: const Color.fromARGB(255, 51, 68, 75),
    inverseSurface: Colors.lightBlue.shade900,
  ),
  /////
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      // fontSize: SizeConfig.screenWidth * 0.02,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      // fontSize: SizeConfig.screenWidth * 0.02,
    ),
  ),
  /////
  appBarTheme: AppBarThemeData(
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
    actionsIconTheme: IconThemeData(color: Colors.white),
  ),
);
