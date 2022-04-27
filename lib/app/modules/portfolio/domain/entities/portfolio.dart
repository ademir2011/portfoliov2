class Portfolio {
  final String? id;
  final String? userId;
  final DateTime? createdAt;
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
