import '../../domain/entities/search_history_entity.dart';

abstract class ISearchHistoryDataSource {
  Future<List<SearchHistoryEntity>> getSearchHistorys();
  Future<void> saveSearchHistorys({required SearchHistoryEntity search});
  Future<void> deleteASearch({required SearchHistoryEntity search});
}
