import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/core/exceptions/result.dart';
import 'package:git_users/modules/user_details/domain/entities/user_details_entity.dart';

abstract class IUserDetailsRepository {
  Future<Result<Failure, UserDetailsEntity>> getUserDetails(
      {required String userName});
}
