import 'package:flutter/material.dart';

class MyTheme {
  static final Color primaryColor = Color(0xFF121312);
  static final Color widgetColor = Color(0xFF282A28);
  static final Color widgetItemColor = Color(0xFF464846);
  static final Color goldColor = Color(0xFFFACC1D);
  static final Color searchColor = Color(0xFF514F4F);


  static final ThemeData appTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 10, color: Color(0xFFB5B4B4)),
        bodyText2: TextStyle(fontSize: 14, color: Colors.white),
        headline4: TextStyle(fontSize: 22, color: Colors.white),
        headline5: TextStyle(fontSize: 24, color: Colors.white),
        headline6: TextStyle(fontSize: 26, color: Colors.white),
      ),

      // appBarTheme: AppBarTheme(
      //     iconTheme: IconThemeData(color: Colors.black),
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     titleTextStyle: TextStyle(
      //       color: Colors.black,
      //       fontSize: 30,
      //       fontWeight: FontWeight.w500,
      //     )),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   selectedIconTheme: IconThemeData(
      //     color: Colors.black,
      //   ),
      //   unselectedIconTheme: IconThemeData(color: Colors.white),
      //   selectedLabelStyle: TextStyle(color: Colors.black),
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.white,
      // )
  );

}
