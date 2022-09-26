import 'package:flutter/material.dart';

import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';

class SearchHistoryEvent {}

class FetchingSearchListEvent extends SearchHistoryEvent {}

class SelectedSearchEvent extends SearchHistoryEvent {
  String search;
  BuildContext context;
  SelectedSearchEvent({
    required this.search,
    required this.context,
  });
}

class DeleteASearchEvent extends SearchHistoryEvent {
  final SearchHistoryEntity search;
  DeleteASearchEvent({
    required this.search,
  });
}
