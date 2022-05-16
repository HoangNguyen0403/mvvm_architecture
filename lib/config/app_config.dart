import 'package:mvvm_architecture/firebase/firebase_options_staging.dart'
    as staging;
import 'package:mvvm_architecture/firebase/firebase_options_dev.dart' as dev;
import 'package:mvvm_architecture/firebase/firebase_options.dart' as prod;

import 'package:firebase_core/firebase_core.dart';

enum AppFlavor {
  dev,
  staging,
  production,
}

class AppConfig {
  final String apiBaseUrl;
  final AppFlavor appFlavor;

  AppConfig({
    required this.apiBaseUrl,
    required this.appFlavor,
  });

  static AppConfig? _instance;

  static AppConfig devConfig = AppConfig(
    apiBaseUrl: 'https://your_api_dev_base_url/api/',
    appFlavor: AppFlavor.dev,
  );

  static AppConfig stagingConfig = AppConfig(
    apiBaseUrl: 'https://your_api_staging_base_url/api/',
    appFlavor: AppFlavor.staging,
  );

  static AppConfig productionConfig = AppConfig(
    apiBaseUrl: 'https://your_api_production_base_url/api/',
    appFlavor: AppFlavor.production,
  );

  FirebaseOptions get flavorFirebaseOption {
    switch (_instance?.appFlavor) {
      case AppFlavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case AppFlavor.staging:
        return staging.DefaultFirebaseOptions.currentPlatform;
      case AppFlavor.production:
        return prod.DefaultFirebaseOptions.currentPlatform;
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }

  static AppConfig? getInstance({flavorName}) {
    if (_instance == null) {
      switch (flavorName) {
        case 'development':
          {
            _instance = devConfig;
          }
          break;
        case 'staging':
          {
            _instance = stagingConfig;
          }
          break;
        case 'production':
          {
            _instance = productionConfig;
          }
          break;
      }
      return _instance;
    }
    return _instance;
  }
}
