import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class IUpdateProjectRepository {
  Future<void> updateProject({required Project project});
}
