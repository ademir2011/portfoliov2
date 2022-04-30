import 'dart:convert';

import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';

class UserEntityModel extends UserEntity {
  String? id;
  String? name;
  String? email;
  String? password;

  UserEntityModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserEntityModel.fromMap(Map<String, dynamic> map) {
    return UserEntityModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntityModel.fromJson(String source) => UserEntityModel.fromMap(json.decode(source));
}
