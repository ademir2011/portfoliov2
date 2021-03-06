import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_project_by_id.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_all_projects_by_portfolio_id.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/update_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/update_project.dart';
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
        Bind.singleton(
          (i) => FirebasePortfolioDatasource(
            firebaseFirestore: i<FirebaseFirestore>(),
            firebaseAuth: i<FirebaseAuth>(),
          ),
        ),
        Bind.singleton(
          (i) => FirebaseProjectDatasource(
            firebaseAuth: i<FirebaseAuth>(),
            firebaseFirestore: i<FirebaseFirestore>(),
          ),
        ),
        Bind.singleton(
          (i) => PortfolioRepository(iPortfolioDatasource: i<FirebasePortfolioDatasource>()),
        ),
        Bind.singleton(
          (i) => ProjectRepository(iProjectDatasource: i<FirebaseProjectDatasource>()),
        ),
        Bind.singleton((i) => FetchPortfolios(iPortfolioRepository: i())),
        Bind.singleton((i) => SavePortfolio(iPortfolioRepository: i())),
        Bind.singleton((i) => UpdatePortfolio(iPortfolioRepository: i())),
        Bind.singleton((i) => RemovePortfolio(iPortfolioRepository: i())),
        Bind.singleton((i) => GetProjectsByPortfolio(iProjectRepository: i())),
        Bind.singleton((i) => SaveProject(iProjectRepository: i())),
        Bind.singleton((i) => RemoveProject(iProjectRepository: i())),
        Bind.singleton((i) => RemoveAllProjectByPortfolioId(iProjectRepository: i())),
        Bind.singleton((i) => GetProjectById(iProjectRepository: i())),
        Bind.singleton((i) => UpdateProject(iProjectRepository: i())),
        Bind.singleton(
          (i) => PortfolioBloc(
            iFetchPortfolios: i(),
            iSavePortfolio: i(),
            iUpdatePortfolio: i(),
            iRemovePortfolio: i(),
            iRemoveAllProjectsByPortfolioId: i(),
          ),
        ),
        Bind.factory(
          (i) => ProjectBloc(
            iGetProjectsByPortfolio: i(),
            iSaveProject: i(),
            iRemoveProject: i(),
            iGetProjectById: i(),
            iUpdateProject: i(),
          ),
        ),
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
          '/project/:projectId',
          child: (ctx, args) => ProjectPage(projectId: args.params['projectId']),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 1),
        ),
      ];
}
