import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

abstract class IRemovePortfolioRepository {
  Future<void> removePortfolio({required Portfolio portfolio});
}
