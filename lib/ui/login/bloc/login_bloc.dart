import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_architecture/repositories/login/login.dart';
import 'package:mvvm_architecture/repositories/utils/exceptions/api_exception.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginPressed>(
      (event, emit) async {
        try {
          emit(LoginLoadingState());
          await loginUseCase.login(
            LoginRequest(
              userName: event.userName,
              password: event.password,
            ),
          );
          if (event.isError) {
            emit(const LoginErrorState("Fake error"));
          } else {
            emit(LoginSuccessState());
          }
        } on ApiException catch (e) {
          emit(LoginErrorState(e.displayError));
        }
      },
    );
  }
}
