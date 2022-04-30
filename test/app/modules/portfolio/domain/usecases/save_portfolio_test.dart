import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_portfolio.dart';

class PortfolioRepositoryMock extends Mock implements IPortfolioRepository {}

void main() {
  test('Deverá salvar sem retornar erros/exceções', () async {
    final portfolioRepositoryMock = PortfolioRepositoryMock();

    final testPortfolio = Portfolio(
      id: '123',
      userId: '123',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: 'teste',
    );

    when(() => portfolioRepositoryMock.savePortfolio(portfolio: testPortfolio)).thenAnswer((_) async => Future.value());

    final savePortfolio = SavePortfolio(iPortfolioRepository: portfolioRepositoryMock);

    final response = savePortfolio.savePortfolio(portfolio: testPortfolio);

    expect(await response.then((value) => true), true);
  });
}
