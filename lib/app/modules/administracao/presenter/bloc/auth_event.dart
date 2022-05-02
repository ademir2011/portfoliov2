import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';

abstract class AuthEvent {}

class SigninAuthEvent extends AuthEvent {
  final String email;
  final String password;
  SigninAuthEvent({
    required this.email,
    required this.password,
  });
}

class LogoutAuthEvent extends AuthEvent {}
