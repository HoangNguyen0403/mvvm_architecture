import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_architecture/repositories/login/models/user_entitiy.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends UserEntity {
  @override
  final String userName;
  final String email;
  final String phone;
  final String createdAt;

  const LoginResponse({
    required this.userName,
    required this.email,
    required this.phone,
    required this.createdAt,
  }) : super(
          userPhone: phone,
          userName: userName,
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
