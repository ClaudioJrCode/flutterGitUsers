import 'package:git_users/core/exceptions/exception.dart';
import '../../../../core/exceptions/result.dart';
import '../entities/search_history_entity.dart';

abstract class ISearchHistoryRepository {
  Future<Result<Failure, List<SearchHistoryEntity>>> getSearchHistorys();

  Future<Result<Failure, void>> saveSearchHistory(
      {required SearchHistoryEntity search});
}
