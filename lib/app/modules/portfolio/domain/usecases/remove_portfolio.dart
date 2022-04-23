import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/remove_portfolio_repository_interface.dart';

abstract class IRemovePortfolio {
  Future<void> removePortfolio({required Portfolio portfolio});
}

class RemovePortfolio implements IRemovePortfolio {
  final IRemovePortfolioRepository iRemovePortfolioRepository;

  RemovePortfolio({required this.iRemovePortfolioRepository});

  @override
  Future<void> removePortfolio({required Portfolio portfolio}) async {
    return await iRemovePortfolioRepository.removePortfolio(portfolio: portfolio);
  }
}
