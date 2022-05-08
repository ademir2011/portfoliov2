import 'package:file_picker/file_picker.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class IProjectRepository {
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio});
  Future<void> removeProject({required Project project});
  Future<void> saveProject({required Project project, required FilePickerResult? filePickerResult});
  Future<void> updateProject({required Project project});
  Future<void> removeAllProjectsByPortfolioId({required Portfolio portfolio});
}
