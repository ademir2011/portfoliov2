import 'dart:convert';

import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';

class ProjectModel extends Project {
  String? id;
  String? userId;
  String? portfolioId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  List<String>? tags;
  List<String>? socialNetwoksUrl;
  String? urlVideo;
  String? urlThumbnail;

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
    this.urlThumbnail,
  });

  Map getMapFromList(List list) => {for (var item in list) '${list.indexOf(item)}': item};

  static List<String> getListFromMap(Map map) => map.values.map((e) => e.toString()).toList();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'portfolioId': portfolioId,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'name': name,
      'description': description,
      'tags': tags != null ? getMapFromList(tags!) : [],
      'socialNetwoksUrl': socialNetwoksUrl != null ? getMapFromList(socialNetwoksUrl!) : [],
      'urlVideo': urlVideo,
      'urlThumbnail': urlThumbnail,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'],
      userId: map['userId'],
      portfolioId: map['portfolioId'],
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt']) : null,
      name: map['name'],
      description: map['description'],
      tags: map['tags'] != null && (map['tags'] as List).isNotEmpty ? ProjectModel.getListFromMap(map['tags']) : null,
      socialNetwoksUrl: map['socialNetwoksUrl'] != null ? ProjectModel.getListFromMap(map['socialNetwoksUrl']) : null,
      urlVideo: map['urlVideo'],
      urlThumbnail: map['urlThumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source));
}
