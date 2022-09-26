import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/core/exceptions/result.dart';
import 'package:git_users/modules/home/domain/entities/user_entity.dart';
import 'package:git_users/modules/home/domain/repositories/user_repository_interface.dart';

import '../datasource/user_data_source_interface.dart';

class UserRepository implements IUserRepository {
  final IUserDataSource userDataSource;

  UserRepository({
    required this.userDataSource,
  });

  @override
  Future<Result<Failure, List<UserEntity>>> getUsers(
      {required String search}) async {
    try {
      final res = await userDataSource.getUsers(search: search);
      return Result.success(res);
    } catch (e, stackTrace) {
      return Result.failure(
        HttpFailure(
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
