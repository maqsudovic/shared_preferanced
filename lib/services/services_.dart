import 'dart:ui';

import 'package:shared_preferanced/model/appchanger_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _sharedPrefsKey = "MyAppSettings";

  Future<Settings> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isNightMode = prefs.getBool("nightMode") ?? false;
    String backgroundColor = prefs.getString("backgroundColor") ?? "#FFFFFF";
    double textSize = prefs.getDouble("textSize") ?? 16.0;
    return Settings(
      isNightMode: isNightMode,
      backgroundColor: backgroundColor,
      textSize: textSize, textColor: prefs.getInt("textColor") ?? 0xFF000000,
    );
  }

  Future<void> saveSettings(Settings settings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("nightMode", settings.isNightMode);
    prefs.setString("backgroundColor", settings.backgroundColor);
    prefs.setInt("textColor", settings.textColor);
    prefs.setDouble("textSize", settings.textSize);
  }
}
