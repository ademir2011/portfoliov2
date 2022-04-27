class Project {
  final String? id;
  final String? userId;
  final String? portfolioId;
  final DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  List<String>? tags;
  List<String>? socialNetwoksUrl;
  String? urlVideo;

  Project({
    this.id,
    this.userId,
    this.portfolioId,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.tags,
    this.socialNetwoksUrl,
    this.urlVideo,
  });
}
