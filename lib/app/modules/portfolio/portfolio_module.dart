import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_fetch_portfolios_datasource.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/fetch_portfolios_repository.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/pages/portfolio_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/pages/project_page.dart';

class PortfolioModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseFetchPortfoliosDatasource()),
        Bind.singleton(
          (i) => FetchPortfoliosRepository(iFetchPortfoliosDatasource: i<FirebaseFetchPortfoliosDatasource>()),
        ),
        Bind.singleton((i) => FetchPortfolios(iFetchPortfoliosRepository: i())),
        Bind.singleton((i) => PortfolioBloc(fetchPortfolios: i())),
      ];

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
