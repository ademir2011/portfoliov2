import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/logout.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/signin.dart';
import 'package:portfoliov2/app/modules/administracao/external/datasources/firebase_auth_datasource.dart';
import 'package:portfoliov2/app/modules/administracao/infra/repositories/auth_repository.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/pages/signin_page.dart';

class AdministracaoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<FirebaseAuth>(FirebaseAuth.instance),
        Bind.singleton((i) => FirebaseAuthDatasource(firebaseAuth: i<FirebaseAuth>())),
        Bind.singleton((i) => AuthRepository(iAuthDatasource: i<FirebaseAuthDatasource>())),
        Bind.singleton((i) => Signin(iAuthRepository: i<AuthRepository>())),
        Bind.singleton((i) => Logout(iAuthRepository: i<AuthRepository>())),
        Bind.singleton(
          (i) => AuthBloc(
            iLogout: i<Logout>(),
            iSignin: i<Signin>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SigninPage(),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 1),
        ),
      ];
}
