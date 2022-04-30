import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';

abstract class IUpdateProject {
  Future<void> updateProject({required Project project});
}

class UpdateProject implements IUpdateProject {
  final IProjectRepository iProjectRepository;

  UpdateProject({required this.iProjectRepository});

  @override
  Future<void> updateProject({required Project project}) async {
    return await iProjectRepository.updateProject(project: project);
  }
}
