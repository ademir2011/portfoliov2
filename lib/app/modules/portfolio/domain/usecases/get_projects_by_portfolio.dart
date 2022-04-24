import 'package:flutter/cupertino.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/get_projects_by_portfolio_repository_interface.dart';

abstract class IGetProjectsByPortfolio {
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio});
}

class GetProjectsByPortfolio implements IGetProjectsByPortfolio {
  final IGetProjectsByPortfolioRepository iGetProjectsByPortfolioRepository;

  GetProjectsByPortfolio({required this.iGetProjectsByPortfolioRepository});
  @override
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio}) async {
    return await iGetProjectsByPortfolioRepository.getProjectsByPortfolio(portfolio: portfolio);
  }
}
