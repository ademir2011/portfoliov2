import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/get_projects_by_portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_projects_by_portfolio.dart';

class GetProjectsByPortfolioRepositoryMock extends Mock implements IGetProjectsByPortfolioRepository {}

void main() {
  testWidgets('get projects by portfolio ...', (tester) async {
    final getProjectsByPortfolioRepositoryMock = GetProjectsByPortfolioRepositoryMock();

    final testPortfolio = Portfolio(
      id: '123',
      userId: '123',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: 'teste',
    );

    when(() => getProjectsByPortfolioRepositoryMock.getProjectsByPortfolio(portfolio: testPortfolio))
        .thenAnswer((_) async => []);

    final getProjectsByPortfolio =
        GetProjectsByPortfolio(iGetProjectsByPortfolioRepository: getProjectsByPortfolioRepositoryMock);

    final response = getProjectsByPortfolio.getProjectsByPortfolio(portfolio: testPortfolio);

    expect(await response.then((value) => true), true);
  });
}
