class Project {
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final List<String> tags;
  final List<String> socialNetwoksUrl;
  final String urlVideo;

  Project({
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.tags,
    required this.socialNetwoksUrl,
    required this.urlVideo,
  });
}
