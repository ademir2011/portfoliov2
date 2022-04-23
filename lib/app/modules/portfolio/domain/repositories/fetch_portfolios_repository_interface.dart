import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class IFetchPortfoliosRepository {
  Future<List<Portfolio>> fetchPortfolios();
}
