import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/project_datasource_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/models/project_model.dart';

class FirebaseProjectDatasource implements IProjectDatasource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  FirebaseProjectDatasource({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  @override
  Future<List<Project>> getProjectsByPortfolio({required Portfolio portfolio}) async {
    final projectCollection = firebaseFirestore.collection('projects');
    final QuerySnapshot<Map<String, dynamic>> projectsMap =
        await projectCollection.where('portfolioId', isEqualTo: portfolio.id).get();

    try {
      final projects = projectsMap.docs.map((projectDS) {
        return ProjectModel.fromMap(projectDS.data());
      }).toList();
      return projects;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeProject({required Project project}) {
    // TODO: implement removeProject
    throw UnimplementedError();
  }

  @override
  Future<void> saveProject({required Project project}) async {
    try {
      final projectCollection = firebaseFirestore.collection('projects');

      final projectModel = ProjectModel(
        portfolioId: project.portfolioId,
        description: project.description,
        name: project.name,
        socialNetwoksUrl: project.socialNetwoksUrl,
        tags: project.tags,
        urlVideo: project.urlVideo,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      DocumentReference docRef = await projectCollection.add(projectModel.toMap());
      projectModel.id = docRef.id;
      projectModel.userId = firebaseAuth.currentUser!.uid;
      await updateProject(project: projectModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateProject({required Project project}) async {
    final projectCollection = firebaseFirestore.collection('projects');

    final projectModel = ProjectModel(
      urlVideo: project.urlVideo,
      tags: project.tags,
      socialNetwoksUrl: project.socialNetwoksUrl,
      userId: project.userId,
      id: project.id,
      portfolioId: project.portfolioId,
      description: project.description,
      name: project.name,
      createdAt: project.createdAt,
      updatedAt: DateTime.now(),
    );

    try {
      await projectCollection.doc(project.id).update(projectModel.toMap());
    } catch (e) {
      throw Exception(e);
    }
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
