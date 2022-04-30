import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/remove_project.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/project_repository.dart';

class ProjectRepositoryMock extends Mock implements ProjectRepository {}

void main() {
  test('Remover projeto sem acusar erros ou exceções', () async {
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

    when(() => projectRepositoryMock.removeProject(project: testProject)).thenAnswer((_) async => Future.value());

    final removeProject = RemoveProject(iProjectRepository: projectRepositoryMock);

    final response = removeProject.removeProject(project: testProject);

    expect(await response.then((value) => true), true);
  });
}
