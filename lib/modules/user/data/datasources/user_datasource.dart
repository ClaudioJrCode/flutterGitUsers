import 'package:git_users/core/adapters/http/http_interface.dart';
import 'package:git_users/modules/user/domain/entities/user_entity.dart';
import 'package:git_users/modules/user/infra/datasource/user_data_source.dart';

import '../models/user_model.dart';

class UserDataSource implements IUserDataSource {
  final IHttpClient client;
  UserDataSource({
    required this.client,
  });
  @override
  Future<List<UserEntity>> getUsers({required String search}) async {
    try {
      final res = await client
          .get("https://api.github.com/search/users?q=$search&per_page=100");

      Map<String, dynamic> response = res.body;
      return List<UserEntity>.from(
          response['items'].map((user) => UserModel.fromMap(user)).toList());
    } catch (e) {
      return [];
    }
  }
}
