import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';

class ProjectRepositoryMock extends Mock implements IProjectRepository {}

void main() {
  testWidgets('get projects by portfolio ...', (tester) async {
    final projectRepositoryMock = ProjectRepositoryMock();

    final testPortfolio = Portfolio(
      id: '123',
      userId: '123',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: 'teste',
    );

    when(() => projectRepositoryMock.getProjectsByPortfolio(portfolio: testPortfolio)).thenAnswer((_) async => []);

    final getProjectsByPortfolio = GetProjectsByPortfolio(iProjectRepository: projectRepositoryMock);

    final response = getProjectsByPortfolio.getProjectsByPortfolio(portfolio: testPortfolio);

    expect(await response.then((value) => true), true);
  });
}
