import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/update_portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/update_portfolio.dart';

class UpdatePortfolioRepositoryMock extends Mock implements IUpdatePortfolioRepository {}

void main() {
  test('Deve atualizar o portfolio sem erros', () async {
    final updatePortfolioRepositoryMock = UpdatePortfolioRepositoryMock();

    final testPortfolio = Portfolio(
      id: '123',
      userId: '123',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: 'teste',
    );

    when(() => updatePortfolioRepositoryMock.updatePortfolio(portfolio: testPortfolio))
        .thenAnswer((_) async => Future.value());

    final updatePortfolio = UpdatePortfolio(iUpdatePortfolioRepository: updatePortfolioRepositoryMock);

    final response = updatePortfolio.updatePortfolio(portfolio: testPortfolio);

    expect(await response.then((value) => true), true);
  });
}
