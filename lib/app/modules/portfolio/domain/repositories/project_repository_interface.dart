import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class IProjectRepository {
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio});
  Future<void> removeProject({required Project project});
  Future<void> saveProject({required Project project});
  Future<void> updateProject({required Project project});
}
