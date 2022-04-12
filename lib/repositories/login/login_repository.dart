import 'login.dart';

class LoginRepository {
  final LoginApi api;

  LoginRepository(this.api);

  Future<UserEntity> login(LoginRequest request) async {
    try {
      // final loginResponse = await api.login(request);
      await Future.delayed(const Duration(seconds: 3));
      return const LoginResponse(
          userName: "UserName", phone: "phone", email: "email", createdAt: '');
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
