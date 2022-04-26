import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class IGetProjectsByPortfolioDatasource {
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio});
}
