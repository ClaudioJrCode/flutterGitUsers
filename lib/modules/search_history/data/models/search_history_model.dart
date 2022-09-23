import 'dart:convert';
import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';

class SearchHistoryModel extends SearchHistoryEntity {
  SearchHistoryModel({
    required super.search,
    required super.id,
    required super.searchDate,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'search': search});
    result.addAll({'id': id});
    result.addAll({'searchDate': searchDate.toString()});

    return result;
  }

  factory SearchHistoryModel.fromMap(Map<String, dynamic> map) {
    return SearchHistoryModel(
      search: map['search'] ?? '',
      id: map['id'] ?? '',
      searchDate: DateTime.parse(map['searchDate']),
    );
  }

  factory SearchHistoryModel.fromEntity(SearchHistoryEntity entity) {
    return SearchHistoryModel(
        id: entity.id, search: entity.search, searchDate: entity.searchDate);
  }

  String toJson() => json.encode(toMap());
  factory SearchHistoryModel.fromJson(String source) =>
      SearchHistoryModel.fromMap(json.decode(source));
}
