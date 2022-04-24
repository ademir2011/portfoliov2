import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/save_project_repository_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_project.dart';

class SaveProjectRepositoryMock extends Mock implements ISaveProjectRepository {}

void main() {
  test('Deve salvar o projeto sem haver erros ou exceções', () async {
    final saveProjectRepositoryMock = SaveProjectRepositoryMock();

    final testProject = Project(
      id: '123',
      portfolioId: '123',
      userId: '123',
      name: 'Whallet',
      description: 'teste',
      socialNetwoksUrl: [],
      tags: [],
      urlVideo: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    when(() => saveProjectRepositoryMock.saveProject(project: testProject)).thenAnswer((_) async => Future.value());

    final saveProject = SaveProject(iSaveProjectRepository: saveProjectRepositoryMock);

    final response = saveProject.saveProject(project: testProject);

    expect(await response.then((value) => true), true);
  });
}
