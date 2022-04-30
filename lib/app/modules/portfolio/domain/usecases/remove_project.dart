import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';

abstract class IRemoveProject {
  Future<void> removeProject({required Project project});
}

class RemoveProject implements IRemoveProject {
  final IProjectRepository iProjectRepository;

  RemoveProject({required this.iProjectRepository});

  @override
  Future<void> removeProject({required Project project}) async {
    return await iProjectRepository.removeProject(project: project);
  }
}
