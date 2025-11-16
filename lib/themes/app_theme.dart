import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.red;
  static const Color textosBlancos = Colors.white;
  static final ThemeData myTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepOrange,
      elevation: 2,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary)
    ),

    cardTheme: CardThemeData(
      shadowColor: primary.withValues(alpha: 0.5) 
    ),

    iconTheme: IconThemeData(
      color: primary
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder(),
        elevation: 0
      )
    )
  );

  static final ThemeData myThemeDark = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey,
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.redAccent,
      elevation: 2,
    ),
  );
}
