import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/get_projects_by_portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/get_projects_by_portfolio_datasource_interface.dart';

class GetProjectsByPortifolioRepository implements IGetProjectsByPortfolioRepository {
  final IGetProjectsByPortfolioDatasource iGetProjectsByPortfolioDatasource;

  GetProjectsByPortifolioRepository({required this.iGetProjectsByPortfolioDatasource});

  @override
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio}) async {
    return await iGetProjectsByPortfolioDatasource.getProjectsByPortfolio(portfolio: portfolio);
  }
}
