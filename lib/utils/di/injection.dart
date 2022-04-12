import 'package:alice/alice.dart';
import 'package:mvvm_architecture/config/app_config.dart';
import 'package:mvvm_architecture/config/navigation_util.dart';
import 'package:mvvm_architecture/config/theme.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_architecture/repositories/login/login.dart';
import 'package:mvvm_architecture/repositories/utils/shared_pref_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt getIt = GetIt.instance;

Future setupInjection() async {
  await _registerAppComponents();
  await _registerNetworkComponents();
  _registerRepository();
}

Future _registerAppComponents() async {
  final sharedPreferencesManager = await SharedPreferencesManager.getInstance();
  getIt.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager!);

  final appTheme = AppTheme();
  getIt.registerSingleton(appTheme);
}

Future<void> _registerNetworkComponents() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.getInstance()!.apiBaseUrl,
      connectTimeout: 10000,
    ),
  );

  final Alice alice = Alice(
    navigatorKey: NavigationUtil.rootKey,
    showShareButton: false,
  );

  getIt.registerSingleton(alice);

  dio.interceptors.addAll(
    [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
      alice.getDioInterceptor(),
    ],
  );
  getIt.registerSingleton(dio);

  getIt
      .registerSingleton(LoginApi(dio, baseUrl: dio.options.baseUrl + 'user/'));
}

void _registerRepository() {
  getIt.registerSingleton(LoginRepository(getIt<LoginApi>()));
}
