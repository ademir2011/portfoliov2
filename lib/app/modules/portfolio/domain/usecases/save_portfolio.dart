import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';

abstract class ISavePortfolio {
  Future<void> savePortfolio({required Portfolio portfolio});
}

class SavePortfolio implements ISavePortfolio {
  final IPortfolioRepository iPortfolioRepository;

  SavePortfolio({required this.iPortfolioRepository});

  @override
  Future<void> savePortfolio({required Portfolio portfolio}) async {
    return await iPortfolioRepository.savePortfolio(portfolio: portfolio);
  }
}
