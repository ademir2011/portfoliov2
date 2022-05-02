import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class SuccessLogoutAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState({required this.message});
}
