import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/list_user_bloc.dart';
import 'ui/list_user_screen.dart';

class ListUserRoute {
  static Widget get route => BlocProvider(
        create: (context) => ListUserBloc()..add(GetListUser()),
        child: const ListUserScreen(),
      );
}
