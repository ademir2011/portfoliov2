import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';

abstract class ISaveProject {
  Future<void> saveProject({required Project project});
}

class SaveProject implements ISaveProject {
  final IProjectRepository iProjectRepository;

  SaveProject({required this.iProjectRepository});

  @override
  Future<void> saveProject({required Project project}) async {
    return await iProjectRepository.saveProject(project: project);
  }
}
