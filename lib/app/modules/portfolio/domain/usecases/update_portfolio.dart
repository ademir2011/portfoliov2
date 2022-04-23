import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/update_portfolio_repository_interface.dart';

abstract class IUpdatePortfolio {
  Future<void> updatePortfolio({required Portfolio portfolio});
}

class UpdatePortfolio implements IUpdatePortfolio {
  final IUpdatePortfolioRepository iUpdatePortfolioRepository;

  UpdatePortfolio({required this.iUpdatePortfolioRepository});

  @override
  Future<void> updatePortfolio({required Portfolio portfolio}) async {
    return await iUpdatePortfolioRepository.updatePortfolio(portfolio: portfolio);
  }
}
