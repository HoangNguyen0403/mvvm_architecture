// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBIKGK7ovuiHm-NVIcy3kjkCv1iVvIiap0',
    appId: '1:863569946908:web:677f4928ab3bf8e79372d9',
    messagingSenderId: '863569946908',
    projectId: 'flutter-temp-clean',
    authDomain: 'flutter-temp-clean.firebaseapp.com',
    storageBucket: 'flutter-temp-clean.appspot.com',
    measurementId: 'G-SMMMGZ2RX4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmA9eDO9UMFFbvARBZfzCwdM2GI1ijo1A',
    appId: '1:863569946908:android:2bb3653912f7837a9372d9',
    messagingSenderId: '863569946908',
    projectId: 'flutter-temp-clean',
    storageBucket: 'flutter-temp-clean.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCg3Fp-7PoCuAfXiZ_MHDvMP9eaBL2YEHk',
    appId: '1:863569946908:ios:1cc6f551a69d44949372d9',
    messagingSenderId: '863569946908',
    projectId: 'flutter-temp-clean',
    storageBucket: 'flutter-temp-clean.appspot.com',
    iosClientId:
        '863569946908-pm7oq36nlfi14tavpmqi7396rv6cknmr.apps.googleusercontent.com',
    iosBundleId: 'com.vmo.c3FlutterTemp.dev',
  );
}
