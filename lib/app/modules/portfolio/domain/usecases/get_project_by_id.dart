import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';

abstract class IGetProjectById {
  Future<Project> getProjectById({required String id});
}

class GetProjectById extends IGetProjectById {
  final IProjectRepository iProjectRepository;

  GetProjectById({required this.iProjectRepository});

  @override
  Future<Project> getProjectById({required String id}) async {
    return await iProjectRepository.getProjectById(id: id);
  }
}
