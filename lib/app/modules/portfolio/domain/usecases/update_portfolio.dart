import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';

abstract class IUpdatePortfolio {
  Future<void> updatePortfolio({required Portfolio portfolio});
}

class UpdatePortfolio implements IUpdatePortfolio {
  final IPortfolioRepository iPortfolioRepository;

  UpdatePortfolio({required this.iPortfolioRepository});

  @override
  Future<void> updatePortfolio({required Portfolio portfolio}) async {
    return await iPortfolioRepository.updatePortfolio(portfolio: portfolio);
  }
}
