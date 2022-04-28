import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';

class GetProjectsByPortfolioMock extends Mock implements GetProjectsByPortfolio {}

void main() {
  late GetProjectsByPortfolioMock getProjectsByPortfolioMock;
  late Portfolio portfolio;

  setUpAll(() {
    getProjectsByPortfolioMock = GetProjectsByPortfolioMock();
    portfolio = Portfolio(title: 'Mobile', id: '1');
    registerFallbackValue(portfolio);
  });

  blocTest<ProjectBloc, ProjectState>(
    'Deve retonar o estado de sucesso',
    build: () {
      when(
        () => getProjectsByPortfolioMock.getProjectsByPortfolio(
          portfolio: any(named: 'portfolio'),
        ),
      ).thenAnswer((_) async => []);
      return ProjectBloc(getProjectsByPortfolio: getProjectsByPortfolioMock);
    },
    act: (bloc) => bloc.add(GetProjectsByPortfolioEvent(portfolio: portfolio)),
    expect: () => [
      isA<LoadingProjectState>(),
      isA<SuccessProjectState>(),
    ],
  );
}
