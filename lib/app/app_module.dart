import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/pages/home_page.dart';
import 'package:portfoliov2/app/modules/home/pages/sidemenu_page.dart';
import 'package:portfoliov2/shared/top_menu_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/portfolio_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const HomePage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/sidemenu',
          child: (ctx, args) => const SidemenuPage(
            topMenuEnum: TopMenuEnum.inicio,
          ),
        ),
        ModuleRoute('/portfolio', module: PortfolioModule()),
      ];
}
