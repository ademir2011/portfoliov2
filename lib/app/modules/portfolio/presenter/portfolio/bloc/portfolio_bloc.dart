import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/fetch_portfolios.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/get_project_by_id.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_all_projects_by_portfolio_id.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/update_portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final IFetchPortfolios iFetchPortfolios;
  final ISavePortfolio iSavePortfolio;
  final IUpdatePortfolio iUpdatePortfolio;
  final IRemovePortfolio iRemovePortfolio;
  final IRemoveAllProjectsByPortfolioId iRemoveAllProjectsByPortfolioId;
  PortfolioBloc({
    required this.iFetchPortfolios,
    required this.iSavePortfolio,
    required this.iUpdatePortfolio,
    required this.iRemovePortfolio,
    required this.iRemoveAllProjectsByPortfolioId,
  }) : super(InitialPortfolioState()) {
    on<FetchPortfolioEvent>(_fetchPortfolioEvent);
    on<SavePortfolioEvent>(_savePortfolioEvent);
    on<UpdatePortfolioEvent>(_updatePortfolioEvent);
    on<RemovePortfolioEvent>(_removePortfolioEvent);
  }

  Future<void> _fetchPortfolioEvent(event, emit) async {
    emit(LoadingPortfolioState());
    try {
      final portfolios = await iFetchPortfolios.fetchPortfolios();
      emit(SuccessPortfolioState(portfolios: portfolios));
    } catch (e) {
      emit(ErrorPortfolioState(message: 'Erro ao recuperar dados'));
    }
  }

  Future<void> _savePortfolioEvent(SavePortfolioEvent event, emit) async {
    emit(LoadingPortfolioState());
    try {
      await iSavePortfolio.savePortfolio(portfolio: event.portfolio);
      emit(SuccessSavePortfolioState());
    } catch (e) {
      emit(ErrorPortfolioState(message: 'Erro ao salvar dados'));
    }
  }

  Future<void> _updatePortfolioEvent(UpdatePortfolioEvent event, emit) async {
    emit(LoadingPortfolioState());
    try {
      await iUpdatePortfolio.updatePortfolio(portfolio: event.portfolio);
      emit(SuccessUpdatePortfolioState());
    } catch (e) {
      emit(ErrorPortfolioState(message: 'Erro ao atualizar dados'));
    }
  }

  Future<void> _removePortfolioEvent(RemovePortfolioEvent event, emit) async {
    emit(LoadingPortfolioState());

    try {
      await iRemoveAllProjectsByPortfolioId.removeAllProjectsByPortfolioId(portfolio: event.portfolio);
    } catch (e) {
      emit(ErrorPortfolioState(message: 'Erro ao remover projetos'));
    }

    try {
      await iRemovePortfolio.removePortfolio(portfolio: event.portfolio);
      emit(SuccessRemovePortfolioState());
    } catch (e) {
      emit(ErrorPortfolioState(message: 'Erro ao remover portfolio'));
    }
  }
}
