import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

abstract class ISaveProjectRepository {
  Future<void> saveProject({required Project project});
}
