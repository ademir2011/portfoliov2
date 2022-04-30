import 'package:flutter_test/flutter_test.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_project_datasource.dart';

void main() {
  test('Deve receber uma lista de prjetos a partir do id do protfolio', () async {
    final firebaseProjectDatasource = FirebaseProjectDatasource();

    final portfolio = Portfolio(title: 'Mobile', id: '1');

    final projects = await firebaseProjectDatasource.getProjectsByPortfolio(portfolio: portfolio);
    expect(projects, isA<List<Project>>());
  });
}
