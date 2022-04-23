import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/remove_portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_portfolio.dart';

class RemovePortfolioRepositoryMock extends Mock implements IRemovePortfolioRepository {}

void main() {
  test('Remover portfolio sem causar erros ou exceções', () async {
    final removePortfolioRepositoryMock = RemovePortfolioRepositoryMock();

    final testPortfolio = Portfolio(
      userId: '123',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: 'teste',
      projects: [],
    );

    when(() => removePortfolioRepositoryMock.removePortfolio(portfolio: testPortfolio))
        .thenAnswer((_) async => Future.value());

    final removePortfolio = RemovePortfolio(iRemovePortfolioRepository: removePortfolioRepositoryMock);

    final response = removePortfolio.removePortfolio(portfolio: testPortfolio);

    expect(await response.then((value) => true), true);
  });
}
