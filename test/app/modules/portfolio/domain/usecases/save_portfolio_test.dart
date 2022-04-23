import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/save_portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_portfolio.dart';

class SavePortfolioRepositoryMock extends Mock implements ISavePortfolioRepository {}

void main() {
  test('Deverá salvar sem retornar erros/exceções', () async {
    final savePortfolioRepositoryMock = SavePortfolioRepositoryMock();

    final testPortfolio = Portfolio(
      userId: '123',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: 'teste',
      projects: [],
    );

    when(() => savePortfolioRepositoryMock.savePortfolio(portfolio: testPortfolio))
        .thenAnswer((_) async => Future.value());

    final savePortfolio = SavePortfolio(iSavePortfolioRepository: savePortfolioRepositoryMock);

    final response = savePortfolio.savePortfolio(portfolio: testPortfolio);

    expect(await response.then((value) => true), true);
  });
}
