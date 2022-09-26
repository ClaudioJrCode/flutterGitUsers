import 'package:git_users/core/adapters/http/http_interface.dart';
import 'package:git_users/modules/user_details/data/models/user_details_model.dart';
import 'package:git_users/modules/user_details/domain/entities/user_details_entity.dart';
import 'package:git_users/modules/user_details/infra/datasource/user_details_data_source_interface.dart';

class UserDetailsDataSource implements IUserDetailsDataSource {
  final IHttpClient client;
  UserDetailsDataSource({
    required this.client,
  });
  @override
  Future<UserDetailsEntity> getUserDetails({required String userName}) async {
    final res = await client.get('https://api.github.com/users/$userName');

    return UserDetailsModel.fromMap(res.body);
  }
}
