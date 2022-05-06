import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/administracao_module.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/is_logged.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/logout.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/signin.dart';
import 'package:portfoliov2/app/modules/administracao/external/datasources/firebase_auth_datasource.dart';
import 'package:portfoliov2/app/modules/administracao/infra/repositories/auth_repository.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/home/pages/home_page.dart';
import 'package:portfoliov2/app/modules/home/pages/sidemenu_page.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/portfolio_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<FirebaseFirestore>(FirebaseFirestore.instance),
        Bind.instance<FirebaseAuth>(FirebaseAuth.instance),
        Bind.singleton((i) => FirebaseAuthDatasource(firebaseAuth: i<FirebaseAuth>())),
        Bind.singleton((i) => AuthRepository(iAuthDatasource: i<FirebaseAuthDatasource>())),
        Bind.singleton((i) => Signin(iAuthRepository: i<AuthRepository>())),
        Bind.singleton((i) => Logout(iAuthRepository: i<AuthRepository>())),
        Bind.singleton((i) => IsLogged(iAuthRepository: i<AuthRepository>())),
        Bind.singleton(
          (i) => AuthBloc(
            iLogout: i<Logout>(),
            iSignin: i<Signin>(),
            iIsLogged: i<IsLogged>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const HomePage(),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 1),
        ),
        ChildRoute(
          '/sidemenu',
          child: (ctx, args) => const SidemenuPage(
            topMenuEnum: TopMenuEnum.inicio,
          ),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 1),
        ),
        ModuleRoute('/portfolio', module: PortfolioModule()),
        ModuleRoute('/administracao', module: AdministracaoModule()),
      ];
}
