import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/remove_project_repository_interface.dart';

abstract class IRemoveProject {
  Future<void> removeProject({required Project project});
}

class RemoveProject implements IRemoveProject {
  IRemoveProjectRepository iRemoveProjectRepository;

  RemoveProject({required this.iRemoveProjectRepository});

  @override
  Future<void> removeProject({required Project project}) async {
    return await iRemoveProjectRepository.removeProject(project: project);
  }
}
