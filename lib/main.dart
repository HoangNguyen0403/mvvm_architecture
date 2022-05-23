import 'dart:developer';

import 'package:alice/alice.dart';
import 'package:mvvm_architecture/config/theme.dart';
import 'package:mvvm_architecture/utils/route/app_routing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/app_config.dart';
import 'utils/di/injection.dart';

void main() async {
  await _beforeRunApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'resources/langs/langs.csv', //Using translations path if using json file
      assetLoader: CsvAssetLoader(), //Remove this line if using json file
      child: MyApp(),
    ),
  );
}

Future<void> _beforeRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await _flavor;

  await Firebase.initializeApp(
    options: AppConfig.getInstance()!.flavorFirebaseOption,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await setupInjection();
}

Future<void> get _flavor async {
  await const MethodChannel('flavor')
      .invokeMethod<String>('getFlavor')
      .then((String? flavor) => AppConfig.getInstance(flavorName: flavor))
      .catchError(
        (error) {
      log("Error when set up enviroment: $error");
      AppConfig.getInstance(flavorName: AppFlavor.dev.name);
    },
  );
}

class MyApp extends StatefulWidget {
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTheme appTheme = getIt<AppTheme>();

  @override
  void initState() {
    appTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    appTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      builder: (_,__) => MaterialApp(
        builder: (context, child) {
          return child ?? const SizedBox();
        },
        title: 'Flutter Template',
        navigatorObservers: <NavigatorObserver>[MyApp.observer],
        navigatorKey: getIt<Alice>().getNavigatorKey(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteDefine.loginScreen.name,
        onGenerateRoute: AppRouting.generateRoute,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appTheme.currentTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
