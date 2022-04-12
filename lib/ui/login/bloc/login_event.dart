part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPressed extends LoginEvent {
  final String userName;
  final String password;
  final bool isError;

  const LoginPressed(
    this.userName,
    this.password,
    this.isError,
  );

  @override
  List<Object> get props => [
        userName,
        password,
        isError,
      ];
}
