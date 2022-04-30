import 'dart:convert';

import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/portfolio_datasource_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/models/portfolio_model.dart';

class FirebasePortfolioDatasource implements IPortfolioDatasource {
  @override
  Future<List<Portfolio>> fetchPortfolios() async {
    final listMap = await Future.delayed(const Duration(milliseconds: 300)).then((_) => jsonDecode(json)) as List;

    final portfolios = listMap.map((e) => PortfolioModel.fromMap(e)).toList();

    return portfolios;
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

const String json = '''
[
{
  "id" : "1",
  "userId" : "2022",
  "createdAt" : 1650644204,
  "updatedAt" : 1650644204,
  "title" : "Mobile"
},
{
  "id" : "2",
  "userId" : "2022",
  "createdAt" : 1650903404,
  "updatedAt" : 1650903404,
  "title" : "Flutter Web"
}
]
''';
