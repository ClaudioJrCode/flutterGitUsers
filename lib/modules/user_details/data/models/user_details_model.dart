import 'dart:convert';

import 'package:git_users/modules/user_details/domain/entities/user_details_entity.dart';

class UserDetailsModel extends UserDetailsEntity {
  UserDetailsModel({
    required super.name,
    required super.id,
    required super.nodeId,
    required super.htmlUrl,
    required super.avatarUrl,
    required super.followers,
    required super.following,
    required super.bio,
    required super.createdAt,
    required super.publicRepos,
    required super.page,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'login': name});
    result.addAll({'id': id});
    result.addAll({'node_id': nodeId});
    result.addAll({'html_url': htmlUrl});
    result.addAll({'avatar_url': avatarUrl});
    result.addAll({'followers': followers});
    result.addAll({'following': following});
    result.addAll({'bio': bio});
    result.addAll({'created_at': createdAt.millisecondsSinceEpoch});
    result.addAll({'public_repos': publicRepos});
    result.addAll({'page': page});

    return result;
  }

  factory UserDetailsModel.fromMap(Map<String, dynamic> map) {
    return UserDetailsModel(
      name: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      nodeId: map['node_id'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      followers: map['followers']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      bio: map['bio'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
      publicRepos: map['public_repos']?.toInt() ?? 0,
      page: map['page'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetailsModel.fromJson(String source) =>
      UserDetailsModel.fromMap(json.decode(source));
}
