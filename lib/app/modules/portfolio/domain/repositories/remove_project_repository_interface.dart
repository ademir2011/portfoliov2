import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class IRemoveProjectRepository {
  Future<void> removeProject({required Project project});
}
