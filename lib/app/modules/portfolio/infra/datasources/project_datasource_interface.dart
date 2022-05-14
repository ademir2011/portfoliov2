import 'package:file_picker/file_picker.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class IProjectDatasource {
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio});
  Future<void> removeProject({required Project project});
  Future<void> saveProject({
    required Project project,
    required FilePickerResult? filePickerResultImage,
    required FilePickerResult? filePickerResultVideo,
  });
  Future<void> updateProject({
    required Project project,
    required FilePickerResult? filePickerResultImage,
    required FilePickerResult? filePickerResultVideo,
  });
  Future<void> removeAllProjectsByPortfolioId({required Portfolio portfolio});
  Future<Project> getProjectById({required String id});
}
