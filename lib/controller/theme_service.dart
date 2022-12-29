import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';


class ThemeService{
  ///Themes
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(color: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    dividerColor: Colors.black12,
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(color: Colors.grey),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.grey),
    dividerColor: Colors.white54,
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}