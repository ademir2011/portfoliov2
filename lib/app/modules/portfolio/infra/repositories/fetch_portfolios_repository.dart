import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/fetch_portfolios_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/fetch_portfolios_datasource_interface.dart';

class FetchPortfoliosRepository implements IFetchPortfoliosRepository {
  final IFetchPortfoliosDatasource iFetchPortfoliosDatasource;

  FetchPortfoliosRepository({required this.iFetchPortfoliosDatasource});

  @override
  Future<List<Portfolio>> fetchPortfolios() async {
    return await iFetchPortfoliosDatasource.fetchPortfolios();
  }
}
