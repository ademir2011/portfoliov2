import 'dart:convert';

import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/project_datasource_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/models/project_model.dart';

class FirebaseProjectDatasource implements IProjectDatasource {
  @override
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio}) async {
    final projectsMaps = await Future.delayed(const Duration(milliseconds: 300)).then(
      (value) => jsonDecode(json),
    ) as List;

    final List<Project> projectsList = projectsMaps.map((e) => ProjectModel.fromMap(e)).toList();

    return projectsList.where((element) => element.portfolioId == portfolio.id).toList();
  }

  @override
  Future<void> removeProject({required Project project}) {
    // TODO: implement removeProject
    throw UnimplementedError();
  }

  @override
  Future<void> saveProject({required Project project}) {
    // TODO: implement saveProject
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject({required Project project}) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}

const String json = '''
[
{
  "id" : "1",
  "userId" : "2022",
  "portfolioId" : "1",
  "createdAt" : 1650644204,
  "updatedAt" : 1650644204,
  "name" : "WHALLET",
  "description" : "dn12uidnu2ndu2nd u2nd u2n udn2u nd2und 2undu2 nu2ndu2nd2nud2n udn2u nd2u asdasdasd aud2n udn2u nd2u asdasdasd aud2n udn2u nd2u asdasdasd aud2n udn2u nd2u asdasdasd asd asd as",
  "tags" : [
    "BloC",
    "Animações"
  ],
  "socialNetwoksUrl" : [
    "linkedin.com",
    "instagram.com"
  ],
  "urlVideo" : "https://video.com.br"
},
{
  "id" : "2",
  "userId" : "2022",
  "portfolioId" : "1",
  "createdAt" : 1650644204,
  "updatedAt" : 1650644204,
  "name" : "WHALLET 2",
  "description" : "dn12uidnu2nd2und 2undu2 nu2ndu2nd2nud2n udn2u21312312 nd2u",
  "tags" : [
    "BloC",
    "Animações"
  ],
  "socialNetwoksUrl" : [
    "linkedin.com",
    "instagram.com"
  ],
  "urlVideo" : "https://video.com.br"
},
{
  "id" : "3",
  "userId" : "2022",
  "portfolioId" : "2",
  "createdAt" : 1650644204,
  "updatedAt" : 1650644204,
  "name" : "WHALLET 3",
  "description" : "dn12uidnu2nd2und 2undu2 nu2ndu2nd2nud2n udn2u21312312 nd2u",
  "tags" : [
    "BloC",
    "Animações"
  ],
  "socialNetwoksUrl" : [
    "linkedin.com",
    "instagram.com"
  ],
  "urlVideo" : "https://video.com.br"
}
]
''';
