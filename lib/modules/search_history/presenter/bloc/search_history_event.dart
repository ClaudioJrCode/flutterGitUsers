import 'package:flutter/material.dart';

class SearchHistoryEvent {}

class FetchingSearchList extends SearchHistoryEvent {}

class SelectedSearch extends SearchHistoryEvent {
  String search;
  BuildContext context;
  SelectedSearch({
    required this.search,
    required this.context,
  });
}
