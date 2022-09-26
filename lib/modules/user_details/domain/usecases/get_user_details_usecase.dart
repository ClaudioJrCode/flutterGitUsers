import 'package:git_users/modules/user_details/domain/repositories/user_details_repository_interface.dart';

import '../../../../core/exceptions/exception.dart';
import '../../../../core/exceptions/result.dart';
import '../entities/user_details_entity.dart';

abstract class IGetUserDetailsUseCase {
  Future<Result<Failure, UserDetailsEntity>> getUserDetails(
      {required String userName});
}

class GetUserDetailsUseCase implements IGetUserDetailsUseCase {
  final IUserDetailsRepository repository;
  GetUserDetailsUseCase({
    required this.repository,
  });
  @override
  Future<Result<Failure, UserDetailsEntity>> getUserDetails(
      {required String userName}) async {
    return await repository.getUserDetails(userName: userName);
  }
}
