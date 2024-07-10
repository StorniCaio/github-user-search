import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  static ThemeController instance = ThemeController();
  bool darkTheme = true;
  bool materialTheme = true;
  changeTheme() {
    darkTheme = !darkTheme;
    notifyListeners();
  }

  changeMaterialTheme() {
    materialTheme = !materialTheme;
    notifyListeners();
  }
}
