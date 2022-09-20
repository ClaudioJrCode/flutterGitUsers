import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/modules/user/domain/entities/user_entity.dart';
import '../../../../core/result.dart';

abstract class IUserRepository {
  Future<Result<Failure, List<UserEntity>>> getUsers({required String search});
}
