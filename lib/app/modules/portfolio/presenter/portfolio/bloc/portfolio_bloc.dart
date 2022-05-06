import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final FetchPortfolios fetchPortfolios;
  final SavePortfolio savePortfolio;
  PortfolioBloc({
    required this.fetchPortfolios,
    required this.savePortfolio,
  }) : super(InitialPortfolioState()) {
    on<FetchPortfolioEvent>(_fetchPortfolioEvent);
    on<SavePortfolioEvent>(_savePortfolioEvent);
  }

  Future<void> _fetchPortfolioEvent(event, emit) async {
    emit(LoadingPortfolioState());
    try {
      final portfolios = await fetchPortfolios.fetchPortfolios();
      emit(SuccessPortfolioState(portfolios: portfolios));
    } catch (e) {
      emit(ErrorPortfolioState(message: 'Erro ao recuperar dados'));
    }
  }

  Future<void> _savePortfolioEvent(SavePortfolioEvent event, emit) async {
    emit(LoadingPortfolioState());
    try {
      await savePortfolio.savePortfolio(portfolio: event.portfolio);
      emit(SuccessSavePortfolioState());
    } catch (e) {
      emit(ErrorPortfolioState(message: 'Erro ao salvar dados'));
    }
  }
}
