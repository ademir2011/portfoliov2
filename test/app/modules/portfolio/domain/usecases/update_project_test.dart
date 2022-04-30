import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/usecases/update_project.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/repositories/project_repository.dart';

class ProjectRepositoryyMock extends Mock implements ProjectRepository {}

void main() {
  test('Deve atualizar o portfolio sem erros', () async {
    final projectRepositoryyMock = ProjectRepositoryyMock();

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

    when(() => projectRepositoryyMock.updateProject(project: testProject)).thenAnswer((_) async => Future.value());

    final updateProject = UpdateProject(iProjectRepository: projectRepositoryyMock);

    final response = updateProject.updateProject(project: testProject);

    expect(await response.then((value) => true), true);
  });
}
