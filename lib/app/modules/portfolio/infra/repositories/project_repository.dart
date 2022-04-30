import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/project_datasource_interface.dart';

class ProjectRepository implements IProjectRepository {
  final IProjectDatasource iProjectDatasource;

  ProjectRepository({required this.iProjectDatasource});

  @override
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio}) async {
    return await iProjectDatasource.getProjectsByPortfolio(portfolio: portfolio);
  }

  @override
  Future<void> removeProject({required Project project}) {
    // TODO: implement removeProject
    throw UnimplementedError();
  }

  @override
  Future<void> saveProject({required Project project}) {
    // TODO: implement saveProject
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject({required Project project}) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}
