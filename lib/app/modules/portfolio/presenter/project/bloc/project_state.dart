import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class ProjectState {}

class InitialProjectState extends ProjectState {}

class LoadingProjectState extends ProjectState {}

class SuccessSaveProjectState extends ProjectState {}

class SuccessRemoveProjectState extends ProjectState {}

class SuccessProjectState extends ProjectState {
  final List<Project> projects;

  SuccessProjectState({required this.projects});
}

class ErrorProjectState extends ProjectState {
  final String message;

  ErrorProjectState({required this.message});
}

class SuccessGetProjectByIdState extends ProjectState {
  final Project project;
  SuccessGetProjectByIdState({required this.project});
}

class SuccessUpdateProjectState extends ProjectState {
  final Project project;
  SuccessUpdateProjectState({required this.project});
}
