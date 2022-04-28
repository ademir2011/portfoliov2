import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_fetch_portfolios_datasource.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_get_projects_by_portfolio_datasource.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/fetch_portfolios_repository.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/get_projects_by_portfolio_repository.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/pages/portfolio_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/pages/project_page.dart';

class PortfolioModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseFetchPortfoliosDatasource()),
        Bind.singleton(
          (i) => FetchPortfoliosRepository(iFetchPortfoliosDatasource: i<FirebaseFetchPortfoliosDatasource>()),
        ),
        Bind.singleton((i) => FetchPortfolios(iFetchPortfoliosRepository: i())),
        Bind.singleton((i) => PortfolioBloc(fetchPortfolios: i())),
        Bind.singleton((i) => FirebaseGetProjectsByPortfolioDatasource()),
        Bind.singleton(
          (i) => GetProjectsByPortifolioRepository(
            iGetProjectsByPortfolioDatasource: i<FirebaseGetProjectsByPortfolioDatasource>(),
          ),
        ),
        Bind.singleton((i) => GetProjectsByPortfolio(iGetProjectsByPortfolioRepository: i())),
        Bind.singleton((i) => ProjectBloc(getProjectsByPortfolio: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const PortfolioPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/project',
          child: (ctx, args) => const ProjectPage(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
