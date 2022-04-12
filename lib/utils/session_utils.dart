import 'package:flutter/material.dart';

import '../config/theme.dart';
import 'di/injection.dart';
import '../repositories/utils/shared_pref_manager.dart';

class SessionUtils {
  static bool get isDarkTheme =>
      getIt<AppTheme>().currentTheme == ThemeMode.dark;

  static void saveAccessToken(String accessToken) =>
      getIt<SharedPreferencesManager>().putString(
        SharedPreferenceKey.keyAccessToken,
        accessToken,
      );
}
