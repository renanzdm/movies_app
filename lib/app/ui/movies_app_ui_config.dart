import 'package:flutter/material.dart';

class MoviesAppUiConfig {
  MoviesAppUiConfig._();

  static String get title => 'Movies App';
  static ThemeData get theme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Metropolis'
      );
}
