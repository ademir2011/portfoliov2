import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class IFetchPortfoliosDatasource {
  Future<List<Portfolio>> fetchPortfolios();
}
