import 'package:ciziping/constant/color.dart';
import 'package:ciziping/models/Preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangeTheme extends ChangeNotifier {
  final _darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: ColorPalette.backgroundColorDark,
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final _lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: ColorPalette.backgroundColorLight,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  ThemeData _themeData;
  ThemeData get themeData => _themeData;
  bool _isDark =
      Preferences.prefs.getString('themeMode') == 'dark' ? true : false;

  bool get isDark => _isDark;

  ChangeTheme() {
    String themeMode = Preferences.prefs.getString('themeMode') ?? 'light';
    if (themeMode == 'light') {
      _themeData = _lightTheme;
    } else {
      _themeData = _darkTheme;
    }
    notifyListeners();
  }

  void setDarkMode() async {
    _themeData = _darkTheme;
    Preferences.prefs.setString('themeMode', 'dark');
    _isDark = true;
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = _lightTheme;
    Preferences.prefs.setString('themeMode', 'light');
    _isDark = false;
    notifyListeners();
  }
}

// Consumer<ChangeTheme>(
//             builder: (context, changeTheme, child) {
//               bool isDark = changeTheme.isDark;
//               return Switch(
//                 value: isDark,
//                 onChanged: (val) {
//                   if (isDark) {
//                     changeTheme.setLightMode();
//                   } else {
//                     changeTheme.setDarkMode();
//                   }
//                   // changeTheme.changeTheme(val);
//                 },
//               );
//             },
//           ),
