import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

class Portfolio {
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  List<Project>? projects;
  Portfolio({
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.projects,
  });
}
