import 'package:file_picker/file_picker.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class ProjectEvent {}

class GetProjectsByPortfolioEvent extends ProjectEvent {
  final Portfolio portfolio;

  GetProjectsByPortfolioEvent({required this.portfolio});
}

class SaveProjectEvent extends ProjectEvent {
  final Project project;
  final FilePickerResult? filePickerResult;
  SaveProjectEvent({
    required this.project,
    required this.filePickerResult,
  });
}

class RemoveProjectEvent extends ProjectEvent {
  final Project project;
  RemoveProjectEvent({required this.project});
}
