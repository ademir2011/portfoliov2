import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_portfolio.dart';

class PortfolioRepositoryMock extends Mock implements IPortfolioRepository {}

void main() {
  test('Remover portfolio sem causar erros ou exceções', () async {
    final portfolioRepositoryMock = PortfolioRepositoryMock();

    final testPortfolio = Portfolio(
      id: '123',
      userId: '123',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: 'teste',
    );

    when(() => portfolioRepositoryMock.removePortfolio(portfolio: testPortfolio))
        .thenAnswer((_) async => Future.value());

    final removePortfolio = RemovePortfolio(iPortfolioRepository: portfolioRepositoryMock);

    final response = removePortfolio.removePortfolio(portfolio: testPortfolio);

    expect(await response.then((value) => true), true);
  });
}
