import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';

class SearchHistoryState {
  List<SearchHistoryEntity> searchs;

  SearchHistoryState({
    required this.searchs,
  });
}

class SearchHistoryStateError extends SearchHistoryState {
  SearchHistoryStateError() : super(searchs: []);
}

class SearchHistoryStateLoaded extends SearchHistoryState {
  SearchHistoryStateLoaded({required super.searchs});
}

class SearchHistoryStateLoading extends SearchHistoryState {
  SearchHistoryStateLoading() : super(searchs: []);
}

class SearchHistoryStateIdle extends SearchHistoryState {
  SearchHistoryStateIdle() : super(searchs: []);
}

class SearchHistoryStateEmptyList extends SearchHistoryState {
  SearchHistoryStateEmptyList() : super(searchs: []);
}
