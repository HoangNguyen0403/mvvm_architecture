import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_architecture/repositories/login/login.dart';
import 'package:mvvm_architecture/utils/di/injection.dart';

import 'bloc/login_bloc.dart';
import 'ui/login_screen.dart';

class LoginRoute {
  static Widget get route => BlocProvider(
        create: (context) => LoginBloc(getIt<LoginRepository>()),
        child: const LoginScreen(),
      );
}
