import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_project_by_id.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_project.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_state.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final IGetProjectsByPortfolio iGetProjectsByPortfolio;
  final ISaveProject iSaveProject;
  final IRemoveProject iRemoveProject;
  final IGetProjectById iGetProjectById;

  ProjectBloc({
    required this.iGetProjectsByPortfolio,
    required this.iSaveProject,
    required this.iRemoveProject,
    required this.iGetProjectById,
  }) : super(InitialProjectState()) {
    on<GetProjectsByPortfolioEvent>(_getProjectsByPortfolioEvent);
    on<SaveProjectEvent>(_saveProjectEvent);
    on<RemoveProjectEvent>(_removeProjectEvent);
    on<GetProjectByIdEvent>(_getProjectByIdEvent);
  }

  Future<void> _getProjectsByPortfolioEvent(GetProjectsByPortfolioEvent event, emit) async {
    emit(LoadingProjectState());
    try {
      final projects = await iGetProjectsByPortfolio.getProjectsByPortfolio(portfolio: event.portfolio);
      emit(SuccessProjectState(projects: projects));
    } catch (e) {
      emit(ErrorProjectState(message: 'Problema'));
    }
  }

  Future<void> _saveProjectEvent(SaveProjectEvent event, emit) async {
    emit(LoadingProjectState());
    try {
      await iSaveProject.saveProject(
        project: event.project,
        filePickerResult: event.filePickerResult,
      );
      emit(SuccessSaveProjectState());
    } catch (e) {
      emit(ErrorProjectState(message: e.toString()));
    }
  }

  Future<void> _removeProjectEvent(RemoveProjectEvent event, emit) async {
    emit(LoadingProjectState());
    try {
      await iRemoveProject.removeProject(project: event.project);
      emit(SuccessRemoveProjectState());
    } catch (e) {
      emit(ErrorProjectState(message: e.toString()));
    }
  }

  Future<void> _getProjectByIdEvent(GetProjectByIdEvent event, emit) async {
    emit(LoadingProjectState());
    try {
      final project = await iGetProjectById.getProjectById(id: event.id);
      emit(SuccessGetProjectByIdState(project: project));
    } catch (e) {
      emit(ErrorProjectState(message: 'Problema'));
    }
  }
}
