import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class ProjectEvent {}

class GetProjectsByPortfolioEvent extends ProjectEvent {
  final Portfolio portfolio;

  GetProjectsByPortfolioEvent({required this.portfolio});
}
