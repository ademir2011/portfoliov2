import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/fetch_portfolios_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';

class IFetchPortfoliosRepositoryMock extends Mock implements IFetchPortfoliosRepository {}

void main() {
  test('Deve receber todos os portfoliso cadastrados', () async {
    final fetchPortfoliosRepositoryMock = IFetchPortfoliosRepositoryMock();

    when(() => fetchPortfoliosRepositoryMock.fetchPortfolios()).thenAnswer((_) async => []);

    final fetchPortfolios = FetchPortfolios(iFetchPortfoliosRepository: fetchPortfoliosRepositoryMock);

    final response = await fetchPortfolios.fetchPortfolios();

    expect(response, []);
  });
}
