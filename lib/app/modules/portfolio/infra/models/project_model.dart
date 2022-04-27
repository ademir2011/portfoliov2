import 'dart:convert';

import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

class ProjectModel extends Project {
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

  ProjectModel({
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'portfolioId': portfolioId,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'name': name,
      'description': description,
      'tags': tags,
      'socialNetwoksUrl': socialNetwoksUrl,
      'urlVideo': urlVideo,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      portfolioId: map['portfolioId'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt']) : null,
      name: map['name'],
      description: map['description'],
      tags: List<String>.from(map['tags']),
      socialNetwoksUrl: List<String>.from(map['socialNetwoksUrl']),
      urlVideo: map['urlVideo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source));
}
