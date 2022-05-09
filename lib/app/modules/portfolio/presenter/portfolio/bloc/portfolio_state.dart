import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class PortfolioState {}

class InitialPortfolioState extends PortfolioState {}

class LoadingPortfolioState extends PortfolioState {}

class SuccessPortfolioState extends PortfolioState {
  final List<Portfolio> portfolios;

  SuccessPortfolioState({required this.portfolios});
}

class SuccessSavePortfolioState extends PortfolioState {}

class SuccessUpdatePortfolioState extends PortfolioState {}

class SuccessRemovePortfolioState extends PortfolioState {}

class ErrorPortfolioState extends PortfolioState {
  final String message;

  ErrorPortfolioState({required this.message});
}
