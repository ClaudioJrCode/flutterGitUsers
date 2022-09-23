import '../../domain/entities/user_entity.dart';

abstract class IUserDataSource {
  Future<List<UserEntity>> getUsers({required String search});
}
