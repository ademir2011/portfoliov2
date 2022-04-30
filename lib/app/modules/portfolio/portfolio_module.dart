import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_portfolio_datasource.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_project_datasource.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/portfolio_repository.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/project_repository.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/pages/portfolio_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/pages/project_page.dart';

class PortfolioModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebasePortfolioDatasource()),
        Bind.singleton(
          (i) => PortfolioRepository(iPortfolioDatasource: i<FirebasePortfolioDatasource>()),
        ),
        Bind.singleton((i) => FetchPortfolios(iPortfolioRepository: i())),
        Bind.singleton((i) => PortfolioBloc(fetchPortfolios: i())),
        Bind.singleton((i) => FirebaseProjectDatasource()),
        Bind.singleton(
          (i) => ProjectRepository(
            iProjectDatasource: i<FirebaseProjectDatasource>(),
          ),
        ),
        Bind.singleton((i) => GetProjectsByPortfolio(iProjectRepository: i())),
        Bind.factory((i) => ProjectBloc(getProjectsByPortfolio: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const PortfolioPage(),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 1),
        ),
        ChildRoute(
          '/project',
          child: (ctx, args) => ProjectPage(project: args.data as Project),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 1),
        ),
      ];
}
