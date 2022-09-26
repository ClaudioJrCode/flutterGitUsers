import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/core/exceptions/result.dart';
import 'package:git_users/modules/user_details/domain/entities/user_details_entity.dart';
import 'package:git_users/modules/user_details/domain/repositories/user_details_repository_interface.dart';
import 'package:git_users/modules/user_details/infra/datasource/user_details_data_source_interface.dart';

class UserDetailsRepository implements IUserDetailsRepository {
  final IUserDetailsDataSource userDetailsDataSource;
  UserDetailsRepository({
    required this.userDetailsDataSource,
  });
  @override
  Future<Result<Failure, UserDetailsEntity>> getUserDetails(
      {required String userName}) async {
    try {
      final res =
          await userDetailsDataSource.getUserDetails(userName: userName);
      return Result.success(res);
    } catch (e, stackTrace) {
      return Result.failure(
          HttpFailure(message: e.toString(), stackTrace: stackTrace));
    }
  }
}
