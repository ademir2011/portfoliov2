import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_portfolio_datasource.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/models/portfolio_model.dart';

void main() {
  test('Deve receber uma lista de portfolios', () async {
    final firebasePortfolioDatasource = FirebasePortfolioDatasource();

    final portfolios = await firebasePortfolioDatasource.fetchPortfolios();
    expect(portfolios, isA<List<Portfolio>>());
  });
}
