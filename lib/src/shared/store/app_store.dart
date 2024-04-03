import 'package:flutter/material.dart';
import 'package:listinha/src/modules/configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    init();
  }

  void init() {
    final model = _configurationService.getConfiguration();
    syncDate.value = model.syncDate;

    themeMode.value = _getThemeModeName(model.themeModeName);
  }

  void save() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) themeMode.value = mode;
    save();
  }

  void setSyncDate(DateTime? date) {
    syncDate.value = date;
    save();
  }

  void deleteApp() {
    _configurationService.deleteAll();
  }

  ThemeMode _getThemeModeName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
