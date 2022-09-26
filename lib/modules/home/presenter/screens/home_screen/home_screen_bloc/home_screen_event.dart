class HomeScreenEvent {}

class FetchUsersListEvent extends HomeScreenEvent {
  final String search;
  FetchUsersListEvent({
    required this.search,
  });
}

class InitOldSearchEvent extends HomeScreenEvent {
  final String search;
  InitOldSearchEvent({
    required this.search,
  });
}
