import 'package:flutter/material.dart';

class AppTheme  {
  
  
ThemeData themeData() => ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: 
  Color.fromARGB(255, 116, 135, 244)),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(backgroundColor: Colors.indigo[300]),
  appBarTheme: AppBarTheme(backgroundColor: Colors.indigo[300]),
  //iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.lerp(255, 116, 135, 244))),
  brightness: Brightness.dark,
  useMaterial3: true,
  //brightness: Brightness.dark
);
}