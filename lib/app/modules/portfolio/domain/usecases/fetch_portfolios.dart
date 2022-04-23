import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/fetch_portfolios_repository_interface.dart';

abstract class IFetchPortfolios {
  Future<List<Portfolio>> fetchPortfolios();
}

class FetchPortfolios implements IFetchPortfolios {
  final IFetchPortfoliosRepository iFetchPortfoliosRepository;

  FetchPortfolios({required this.iFetchPortfoliosRepository});

  @override
  Future<List<Portfolio>> fetchPortfolios() async {
    return await iFetchPortfoliosRepository.fetchPortfolios();
  }
}
