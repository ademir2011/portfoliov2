import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/update_project_repository_interface.dart';

abstract class IUpdateProject {
  Future<void> updateProject({required Project project});
}

class UpdateProject implements IUpdateProject {
  IUpdateProjectRepository iUpdateProjectRepository;

  UpdateProject({required this.iUpdateProjectRepository});

  @override
  Future<void> updateProject({required Project project}) async {
    return await iUpdateProjectRepository.updateProject(project: project);
  }
}
