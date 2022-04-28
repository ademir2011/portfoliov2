import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class PortfolioState {}

class InitialPortfolioState extends PortfolioState {}

class LoadingPortfolioState extends PortfolioState {}

class SuccessPortfolioState extends PortfolioState {
  final List<Portfolio> portfolios;

  SuccessPortfolioState({required this.portfolios});
}

class ErrorPortfolioState extends PortfolioState {
  final String message;

  ErrorPortfolioState({required this.message});
}
