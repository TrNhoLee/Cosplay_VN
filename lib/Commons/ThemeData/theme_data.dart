import 'package:flutter/material.dart';

//Home screen
const appBarTheme = AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent);
final bottomNavigationBarThemeData = BottomNavigationBarThemeData(
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white.withOpacity(0.6),
  selectedIconTheme: const IconThemeData(color: Colors.white, size: 18),
  unselectedIconTheme:
      IconThemeData(color: Colors.white.withOpacity(0.6), size: 18),
  showUnselectedLabels: true,
);
