import 'dart:convert';

import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';

class PortfolioModel extends Portfolio {
  String? id;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String title;

  PortfolioModel({
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    required this.title,
  }) : super(title: title);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'title': title,
    };
  }

  factory PortfolioModel.fromMap(Map<String, dynamic> map) {
    return PortfolioModel(
      id: map['id'],
      userId: map['userId'],
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt']) : null,
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PortfolioModel.fromJson(String source) => PortfolioModel.fromMap(json.decode(source));
}
