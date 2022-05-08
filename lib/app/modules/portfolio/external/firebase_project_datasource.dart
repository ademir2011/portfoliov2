import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      final projects = projectsMap.docs.map((projectDS) => ProjectModel.fromMap(projectDS.data())).toList();
      return projects;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<void> removeProject({required Project project}) async {
    final projectCollection = firebaseFirestore.collection('projects');
    try {
      await projectCollection.doc(project.id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> saveProject({required Project project, required FilePickerResult? filePickerResult}) async {
    final projectCollection = firebaseFirestore.collection('projects');

    final projectModel = ProjectModel(
      portfolioId: project.portfolioId,
      description: project.description,
      name: project.name,
      socialNetwoksUrl: project.socialNetwoksUrl,
      tags: project.tags,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    if (project.urlVideo != null && filePickerResult != null && filePickerResult.files.first.bytes != null) {
      final path = 'videos/${firebaseAuth.currentUser!.uid}/${project.urlVideo}';
      final ref = FirebaseStorage.instance.ref(path);

      try {
        final uploadtask = await ref.putData(filePickerResult.files.first.bytes!);
        projectModel.urlVideo = await uploadtask.ref.getDownloadURL();
      } catch (e) {
        throw Exception(e);
      }
    }

    try {
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

  @override
  Future<void> removeAllProjectsByPortfolioId({required Portfolio portfolio}) async {
    final projectCollection = firebaseFirestore.collection('projects');
    final projects = await getProjectsByPortfolio(portfolio: portfolio);

    try {
      for (var project in projects) {
        await projectCollection.doc(project.id).delete();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
