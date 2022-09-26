import 'package:git_users/modules/user_details/domain/entities/user_details_entity.dart';

class UserDetailsState {
  UserDetailsEntity? userDetails;
  UserDetailsState({
    required this.userDetails,
  });
}

class UserDetailsScreenLoadedState extends UserDetailsState {
  UserDetailsScreenLoadedState({required super.userDetails});
}

class UserDetailScreenLoadingState extends UserDetailsState {
  UserDetailScreenLoadingState() : super(userDetails: null);
}

class UserDetailScreenErrorState extends UserDetailsState {
  UserDetailScreenErrorState() : super(userDetails: null);
}
