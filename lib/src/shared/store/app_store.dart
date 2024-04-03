import 'package:flutter/material.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) themeMode.value = mode;
    save();
  }

  void save() {
    //TODO: salvar dados na base local.
  }
}
