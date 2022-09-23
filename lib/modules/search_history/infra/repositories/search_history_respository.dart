import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/core/exceptions/result.dart';

import '../../domain/entities/search_history_entity.dart';
import '../../domain/repositories/search_history_repository_interface.dart';
import '../datasource/search_history_data_source.dart';

class SearchHistoryRepository implements ISearchHistoryRepository {
  final ISearchHistoryDataSource searchHistoryDataSource;

  SearchHistoryRepository({
    required this.searchHistoryDataSource,
  });

  @override
  Result<Failure, List<SearchHistoryEntity>> getSearchHistorys() {
    try {
      final res = searchHistoryDataSource.getSearchHistorys();
      return Result.success(res);
    } catch (e) {
      return Result.failure(BasicError(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, void>> saveSearchHistory(
      {required SearchHistoryEntity search}) async {
    try {
      await searchHistoryDataSource.saveSearchHistorys(search: search);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(BasicError(message: e.toString()));
    }
  }
}
