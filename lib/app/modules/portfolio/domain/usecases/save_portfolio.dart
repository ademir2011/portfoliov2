import 'package:flutter/foundation.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/save_portfolio_repository_interface.dart';

abstract class ISavePortfolio {
  Future<void> savePortfolio({required Portfolio portfolio});
}

class SavePortfolio implements ISavePortfolio {
  final ISavePortfolioRepository iSavePortfolioRepository;

  SavePortfolio({required this.iSavePortfolioRepository});

  @override
  Future<void> savePortfolio({required Portfolio portfolio}) async {
    return await iSavePortfolioRepository.savePortfolio(portfolio: portfolio);
  }
}
