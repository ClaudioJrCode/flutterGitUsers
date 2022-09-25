import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/core/exceptions/result.dart';

import '../../domain/entities/search_history_entity.dart';
import '../../domain/repositories/search_history_repository_interface.dart';
import '../datasource/search_history_datasource_interface.dart';

class SearchHistoryRepository implements ISearchHistoryRepository {
  final ISearchHistoryDataSource searchHistoryDataSource;

  SearchHistoryRepository({
    required this.searchHistoryDataSource,
  });

  @override
  Future<Result<Failure, List<SearchHistoryEntity>>> getSearchHistorys() async {
    try {
      final res = await searchHistoryDataSource.getSearchHistorys();
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

  @override
  Future<Result<Failure, void>> deleteASearch(
      {required SearchHistoryEntity search}) async {
    try {
      await searchHistoryDataSource.deleteASearch(search: search);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(BasicError(message: e.toString()));
    }
  }
}
