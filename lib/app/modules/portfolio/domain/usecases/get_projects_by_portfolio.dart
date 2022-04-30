import 'package:flutter/cupertino.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';

abstract class IGetProjectsByPortfolio {
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio});
}

class GetProjectsByPortfolio implements IGetProjectsByPortfolio {
  final IProjectRepository iProjectRepository;

  GetProjectsByPortfolio({required this.iProjectRepository});
  @override
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio}) async {
    return await iProjectRepository.getProjectsByPortfolio(portfolio: portfolio);
  }
}
