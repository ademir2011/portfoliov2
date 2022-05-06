import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_project.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjectsByPortfolio getProjectsByPortfolio;
  final SaveProject saveProject;

  ProjectBloc({
    required this.getProjectsByPortfolio,
    required this.saveProject,
  }) : super(InitialProjectState()) {
    on<GetProjectsByPortfolioEvent>(_getProjectsByPortfolioEvent);
    on<SaveProjectEvent>(_saveProjectEvent);
  }

  Future<void> _getProjectsByPortfolioEvent(GetProjectsByPortfolioEvent event, emit) async {
    emit(LoadingProjectState());
    try {
      final projects = await getProjectsByPortfolio.getProjectsByPortfolio(portfolio: event.portfolio);
      emit(SuccessProjectState(projects: projects));
    } catch (e) {
      emit(ErrorProjectState(message: 'Problema'));
    }
  }

  Future<void> _saveProjectEvent(SaveProjectEvent event, emit) async {
    emit(LoadingProjectState());
    try {
      await saveProject.saveProject(project: event.project);
      emit(SuccessSaveProjectState());
    } catch (e) {
      emit(ErrorProjectState(message: e.toString()));
    }
  }
}
