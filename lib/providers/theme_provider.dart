import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light; // theme of our app

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void changeTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkThemes = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,

      //chage color of text according on theme
      colorScheme: const ColorScheme.dark(),

      //use by Theme.of(context).primaryColor
      primaryColor: Colors.black,

      //this for icon colors
      iconTheme: IconThemeData(color: Colors.grey[300]));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,

      //chage color of text according on theme
      colorScheme: const ColorScheme.light(),

      //this for NavigationBar , appBar
      primaryColor: Colors.white,

      //this for icon colors
      iconTheme: IconThemeData(color: Colors.cyanAccent));
}
