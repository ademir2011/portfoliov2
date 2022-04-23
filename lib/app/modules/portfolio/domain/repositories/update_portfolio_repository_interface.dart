import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class IUpdatePortfolioRepository {
  Future<void> updatePortfolio({required Portfolio portfolio});
}
