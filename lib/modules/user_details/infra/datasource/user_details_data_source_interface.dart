import 'package:git_users/modules/user_details/domain/entities/user_details_entity.dart';

abstract class IUserDetailsDataSource {
  Future<UserDetailsEntity> getUserDetails({required String userName});
}
