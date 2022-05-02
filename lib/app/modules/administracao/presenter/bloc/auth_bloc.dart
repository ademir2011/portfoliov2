import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';
import 'package:portfoliov2/app/modules/administracao/domain/repositories/auth_repository_interface.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/logout.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/signin.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_event.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ISignin iSignin;
  final ILogout iLogout;

  AuthBloc({
    required this.iSignin,
    required this.iLogout,
  }) : super(InitialAuthState()) {
    on<SigninAuthEvent>(_signinAuthEvent);
    on<LogoutAuthEvent>(_logoutAuthEvent);
  }

  Future<void> _signinAuthEvent(SigninAuthEvent event, emit) async {
    emit(LoadingAuthState());
    try {
      final userEntity = UserEntity(email: event.email, password: event.password);
      await iSignin.signin(userEntity: userEntity);
      emit(SuccessAuthState());
    } catch (e) {
      emit(ErrorAuthState(message: e.toString()));
    }
  }

  Future<void> _logoutAuthEvent(event, emit) async {
    emit(LoadingAuthState());
    try {
      await iLogout.logout();
      emit(SuccessAuthState());
    } catch (e) {
      emit(ErrorAuthState(message: e.toString()));
    }
  }
}
