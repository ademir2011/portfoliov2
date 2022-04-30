import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class IPortfolioRepository {
  Future<List<Portfolio>> fetchPortfolios();
  Future<void> removePortfolio({required Portfolio portfolio});
  Future<void> savePortfolio({required Portfolio portfolio});
  Future<void> updatePortfolio({required Portfolio portfolio});
}
