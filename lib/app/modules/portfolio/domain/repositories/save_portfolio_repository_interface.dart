import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class ISavePortfolioRepository {
  Future<void> savePortfolio({required Portfolio portfolio});
}
