import 'package:file_picker/file_picker.dart';
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
  Future<void> removeProject({required Project project}) async {
    return await iProjectDatasource.removeProject(project: project);
  }

  @override
  Future<void> saveProject({
    required Project project,
    required FilePickerResult? filePickerResultImage,
    required FilePickerResult? filePickerResultVideo,
  }) async {
    return await iProjectDatasource.saveProject(
      project: project,
      filePickerResultImage: filePickerResultImage,
      filePickerResultVideo: filePickerResultVideo,
    );
  }

  @override
  Future<void> updateProject({
    required Project project,
    required FilePickerResult? filePickerResultImage,
    required FilePickerResult? filePickerResultVideo,
  }) async {
    return await iProjectDatasource.updateProject(
      project: project,
      filePickerResultImage: filePickerResultImage,
      filePickerResultVideo: filePickerResultVideo,
    );
  }

  @override
  Future<void> removeAllProjectsByPortfolioId({required Portfolio portfolio}) async {
    return await iProjectDatasource.removeAllProjectsByPortfolioId(portfolio: portfolio);
  }

  @override
  Future<Project> getProjectById({required String id}) async {
    return await iProjectDatasource.getProjectById(id: id);
  }
}
