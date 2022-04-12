part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  const LoginErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}
