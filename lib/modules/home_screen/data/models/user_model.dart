import 'dart:convert';

import 'package:git_users/modules/home_screen/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.id, required super.avatar});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['login'] ?? '',
      id: map['id']?.toString() ?? '',
      avatar: map['avatar_url'] ?? '',
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
