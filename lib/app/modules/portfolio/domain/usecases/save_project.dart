import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/save_project_repository_interface.dart';

abstract class ISaveProject {
  Future<void> saveProject({required Project project});
}

class SaveProject implements ISaveProject {
  final ISaveProjectRepository iSaveProjectRepository;

  SaveProject({required this.iSaveProjectRepository});

  @override
  Future<void> saveProject({required Project project}) async {
    return await iSaveProjectRepository.saveProject(project: project);
  }
}
