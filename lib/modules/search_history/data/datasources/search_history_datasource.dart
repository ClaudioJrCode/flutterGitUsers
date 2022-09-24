import 'dart:convert';

import 'package:git_users/core/adapters/shared_preferences/shared_prefs_interface.dart';
import 'package:git_users/modules/search_history/data/models/search_history_model.dart';
import '../../domain/entities/search_history_entity.dart';
import '../../infra/datasource/search_history_datasource_interface.dart';

class SearchHistoryDataSource implements ISearchHistoryDataSource {
  final ISharedPreferences prefs;
  SearchHistoryDataSource({
    required this.prefs,
  });
  @override
  Future<List<SearchHistoryEntity>> getSearchHistorys() async {
    final res = await prefs.getString(objectName: "SEARCH LIST");
    if (res == null) return [];
    final decoded = jsonDecode(res);
    return List<SearchHistoryEntity>.from(
        decoded.map((e) => SearchHistoryModel.fromMap(e)).toList());
  }

  @override
  Future<void> saveSearchHistorys({required SearchHistoryEntity search}) async {
    List<SearchHistoryEntity> searchList = await getSearchHistorys();

    searchList.add(SearchHistoryModel.fromEntity(search));
    final encoded = searchList
        .map((e) => SearchHistoryModel.fromEntity(e).toMap())
        .toList();
    await prefs.saveString(
        json: jsonEncode(encoded), objectName: "SEARCH LIST");
  }
}
