import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';

class PortfolioRepositoryMock extends Mock implements IPortfolioRepository {}

void main() {
  test('Deve receber todos os portfoliso cadastrados', () async {
    final portfolioRepositoryMock = PortfolioRepositoryMock();

    when(() => portfolioRepositoryMock.fetchPortfolios()).thenAnswer((_) async => []);

    final fetchPortfolios = FetchPortfolios(iPortfolioRepository: portfolioRepositoryMock);

    final response = await fetchPortfolios.fetchPortfolios();

    expect(response, []);
  });
}
