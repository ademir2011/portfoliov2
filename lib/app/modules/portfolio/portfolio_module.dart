import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/pages/portfolio_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/pages/project_page.dart';

class PortfolioModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const PortfolioPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/project',
          child: (ctx, args) => const ProjectPage(),
          transition: TransitionType.noTransition,
        ),
      ];
}
