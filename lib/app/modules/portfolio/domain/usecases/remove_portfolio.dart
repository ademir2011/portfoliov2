import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';

abstract class IRemovePortfolio {
  Future<void> removePortfolio({required Portfolio portfolio});
}

class RemovePortfolio implements IRemovePortfolio {
  final IPortfolioRepository iPortfolioRepository;

  RemovePortfolio({required this.iPortfolioRepository});

  @override
  Future<void> removePortfolio({required Portfolio portfolio}) async {
    return await iPortfolioRepository.removePortfolio(portfolio: portfolio);
  }
}
