import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class ProjectEvent {}

class GetProjectsByPortfolioEvent extends ProjectEvent {
  final Portfolio portfolio;

  GetProjectsByPortfolioEvent({required this.portfolio});
}
