import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class PortfolioEvent {}

class FetchPortfolioEvent extends PortfolioEvent {}

class SavePortfolioEvent extends PortfolioEvent {
  final Portfolio portfolio;

  SavePortfolioEvent({required this.portfolio});
}
