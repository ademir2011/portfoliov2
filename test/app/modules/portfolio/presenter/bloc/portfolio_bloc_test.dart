import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/bloc/portfolio_state.dart';

class FetchPortfoliosMock extends Mock implements FetchPortfolios {}

void main() {
  late FetchPortfoliosMock fetchPortfoliosMock;

  setUpAll(() {
    fetchPortfoliosMock = FetchPortfoliosMock();
  });

  blocTest<PortfolioBloc, PortfolioState>(
    'Deve retonar o estado de sucesso',
    build: () {
      when(() => fetchPortfoliosMock.fetchPortfolios()).thenAnswer((_) async => []);
      return PortfolioBloc(fetchPortfolios: fetchPortfoliosMock);
    },
    act: (bloc) => bloc.add(FetchPortfolioEvent()),
    expect: () => [
      isA<LoadingPortfolioState>(),
      isA<SuccessPortfolioState>(),
    ],
  );
}
