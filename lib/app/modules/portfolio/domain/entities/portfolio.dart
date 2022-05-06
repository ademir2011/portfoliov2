class Portfolio {
  String? id;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String title;

  Portfolio({
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    required this.title,
  });
}
