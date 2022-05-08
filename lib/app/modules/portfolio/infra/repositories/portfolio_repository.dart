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
  Future<void> removePortfolio({required Portfolio portfolio}) async {
    return await iPortfolioDatasource.removePortfolio(portfolio: portfolio);
  }

  @override
  Future<void> savePortfolio({required Portfolio portfolio}) async {
    return await iPortfolioDatasource.savePortfolio(portfolio: portfolio);
  }

  @override
  Future<void> updatePortfolio({required Portfolio portfolio}) async {
    return await iPortfolioDatasource.updatePortfolio(portfolio: portfolio);
  }
}
