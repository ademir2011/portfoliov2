import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_fetch_portfolios_datasource.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/models/portfolio_model.dart';

void main() {
  test('Deve receber uma lista de portfolios', () async {
    final firebaseFetchPortfoliosDatasource = FirebaseFetchPortfoliosDatasource();

    final portfolios = await firebaseFetchPortfoliosDatasource.fetchPortfolios();
    expect(portfolios, isA<List<Portfolio>>());
  });
}
