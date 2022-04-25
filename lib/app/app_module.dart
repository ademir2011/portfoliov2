import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/home_page.dart';
import 'package:portfoliov2/app/modules/portfolio/portfolio_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const HomePage(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute('/portfolio', module: PortfolioModule()),
      ];
}
