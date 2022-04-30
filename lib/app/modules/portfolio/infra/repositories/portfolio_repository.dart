import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/portfolio_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/portfolio_datasource_interface.dart';

class PortfolioRepository implements IPortfolioRepository {
  final IPortfolioDatasource iPortfolioDatasource;

  PortfolioRepository({required this.iPortfolioDatasource});

  @override
  Future<List<Portfolio>> fetchPortfolios() async {
    return await iPortfolioDatasource.fetchPortfolios();
  }

  @override
  Future<void> removePortfolio({required Portfolio portfolio}) {
    // TODO: implement removePortfolio
    throw UnimplementedError();
  }

  @override
  Future<void> savePortfolio({required Portfolio portfolio}) {
    // TODO: implement savePortfolio
    throw UnimplementedError();
  }

  @override
  Future<void> updatePortfolio({required Portfolio portfolio}) {
    // TODO: implement updatePortfolio
    throw UnimplementedError();
  }
}
