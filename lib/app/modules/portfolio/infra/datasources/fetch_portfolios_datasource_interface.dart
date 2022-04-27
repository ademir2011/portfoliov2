import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/models/portfolio_model.dart';

abstract class IFetchPortfoliosDatasource {
  Future<List<Portfolio>> fetchPortfolios();
}
