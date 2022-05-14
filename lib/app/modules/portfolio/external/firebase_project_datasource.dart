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

  void saveVideo() {}

  void saveImage() {}

  @override
  Future<void> saveProject({
    required Project project,
    required FilePickerResult? filePickerResultImage,
    required FilePickerResult? filePickerResultVideo,
  }) async {
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

    if (project.urlVideo != null && filePickerResultVideo != null && filePickerResultVideo.files.first.bytes != null) {
      final path = 'videos/${firebaseAuth.currentUser!.uid}/${project.urlVideo}';
      final ref = FirebaseStorage.instance.ref(path);

      try {
        final uploadtaskVideo = await ref.putData(filePickerResultVideo.files.first.bytes!);
        projectModel.urlVideo = await uploadtaskVideo.ref.getDownloadURL();
      } catch (e) {
        throw Exception(e);
      }
    }

    if (project.urlThumbnail != null &&
        filePickerResultImage != null &&
        filePickerResultImage.files.first.bytes != null) {
      final path = 'images/${firebaseAuth.currentUser!.uid}/${project.urlThumbnail}';
      final ref = FirebaseStorage.instance.ref(path);

      try {
        final uploadtaskImage = await ref.putData(filePickerResultImage.files.first.bytes!);
        projectModel.urlThumbnail = await uploadtaskImage.ref.getDownloadURL();
      } catch (e) {
        throw Exception(e);
      }
    }

    try {
      DocumentReference docRef = await projectCollection.add(projectModel.toMap());
      projectModel.id = docRef.id;
      projectModel.userId = firebaseAuth.currentUser!.uid;
      await updateProject(
        project: projectModel,
        filePickerResultVideo: null,
        filePickerResultImage: null,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateProject({
    required Project project,
    required FilePickerResult? filePickerResultImage,
    required FilePickerResult? filePickerResultVideo,
  }) async {
    final projectCollection = firebaseFirestore.collection('projects');

    final projectModel = ProjectModel(
      urlVideo: project.urlVideo,
      urlThumbnail: project.urlThumbnail,
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

    if (project.urlVideo != null && filePickerResultVideo != null && filePickerResultVideo.files.first.bytes != null) {
      final path = 'videos/${firebaseAuth.currentUser!.uid}/${project.urlVideo}';
      final ref = FirebaseStorage.instance.ref(path);

      try {
        final uploadtaskVideo = await ref.putData(filePickerResultVideo.files.first.bytes!);
        projectModel.urlVideo = await uploadtaskVideo.ref.getDownloadURL();
      } catch (e) {
        throw Exception(e);
      }
    }

    if (project.urlThumbnail != null &&
        filePickerResultImage != null &&
        filePickerResultImage.files.first.bytes != null) {
      final path = 'images/${firebaseAuth.currentUser!.uid}/${project.urlThumbnail}';
      final ref = FirebaseStorage.instance.ref(path);

      try {
        final uploadtaskImage = await ref.putData(filePickerResultImage.files.first.bytes!);
        projectModel.urlThumbnail = await uploadtaskImage.ref.getDownloadURL();
      } catch (e) {
        throw Exception(e);
      }
    }

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

  @override
  Future<Project> getProjectById({required String id}) async {
    final projectCollection = firebaseFirestore.collection('projects');
    final QuerySnapshot<Map<String, dynamic>> projectsMap = await projectCollection.where('id', isEqualTo: id).get();

    try {
      final projects = projectsMap.docs.map((projectDS) => ProjectModel.fromMap(projectDS.data())).toList();
      return projects.first;
    } catch (e) {
      throw Exception(e);
    }
  }
}
