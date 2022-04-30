import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/save_project.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/project_repository.dart';

class ProjectRepositoryMock extends Mock implements ProjectRepository {}

void main() {
  test('Deve salvar o projeto sem haver erros ou exceções', () async {
    final projectRepositoryMock = ProjectRepositoryMock();

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

    when(() => projectRepositoryMock.saveProject(project: testProject)).thenAnswer((_) async => Future.value());

    final saveProject = SaveProject(iProjectRepository: projectRepositoryMock);

    final response = saveProject.saveProject(project: testProject);

    expect(await response.then((value) => true), true);
  });
}
