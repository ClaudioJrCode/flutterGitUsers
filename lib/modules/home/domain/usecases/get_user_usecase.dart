import '../../../../core/exceptions/exception.dart';
import '../../../../core/exceptions/result.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository_interface.dart';

abstract class IGetUserUseCase {
  Future<Result<Failure, List<UserEntity>>> getUsers({required String search});
}

class GetUserUseCase implements IGetUserUseCase {
  final IUserRepository repository;

  GetUserUseCase({required this.repository});

  @override
  Future<Result<Failure, List<UserEntity>>> getUsers(
          {required String search}) async =>
      await repository.getUsers(search: search);
}
