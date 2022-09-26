class UserDetailsEvent {}

class FetchUserDetailsEvent extends UserDetailsEvent {
  final String userName;
  FetchUserDetailsEvent({
    required this.userName,
  });
}
