import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';

abstract class IFetchPortfolios {
  Future<List<Portfolio>> fetchPortfolios();
}

class FetchPortfolios implements IFetchPortfolios {
  final IPortfolioRepository iPortfolioRepository;

  FetchPortfolios({required this.iPortfolioRepository});

  @override
  Future<List<Portfolio>> fetchPortfolios() async {
    return await iPortfolioRepository.fetchPortfolios();
  }
}
