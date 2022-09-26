import 'package:git_users/modules/home/domain/entities/user_entity.dart';

class HomeScreenState {
  List<UserEntity> users;

  HomeScreenState({
    required this.users,
  });
}

class HomeScreenStateError extends HomeScreenState {
  HomeScreenStateError() : super(users: []);
}

class HomeScreenStateLoaded extends HomeScreenState {
  HomeScreenStateLoaded({required super.users});
}

class HomeScreenStateLoading extends HomeScreenState {
  HomeScreenStateLoading() : super(users: []);
}

class HomeScreenStateIdle extends HomeScreenState {
  HomeScreenStateIdle() : super(users: []);
}

class HomeScreenStateEmptyList extends HomeScreenState {
  HomeScreenStateEmptyList() : super(users: []);
}
