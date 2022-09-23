import '../../domain/entities/search_history_entity.dart';

abstract class ISearchHistoryDataSource {
  List<SearchHistoryEntity> getSearchHistorys();
  Future<void> saveSearchHistorys({required SearchHistoryEntity search});
}
