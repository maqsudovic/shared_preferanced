import 'package:shared_preferanced/model/appchanger_model.dart';
import 'package:shared_preferanced/services/services_.dart';

class SettingsController {
  final _settingsService = SettingsService();

  Future<Settings> getSettings() async {
    return await _settingsService.loadSettings();
  }

  void saveSettings(Settings settings) async {
    await _settingsService.saveSettings(settings);
  }
}
