import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';
import 'package:git_users/modules/search_history/domain/repositories/search_history_repository_interface.dart';

import '../../../../core/exceptions/exception.dart';
import '../../../../core/exceptions/result.dart';

abstract class IGetSearchHistoryUseCase {
  Future<Result<Failure, List<SearchHistoryEntity>>> getSearchHistory();
}

class GetSearchHistoryUseCase implements IGetSearchHistoryUseCase {
  final ISearchHistoryRepository repository;

  GetSearchHistoryUseCase({required this.repository});

  @override
  Future<Result<Failure, List<SearchHistoryEntity>>> getSearchHistory() async {
    return await repository.getSearchHistorys();
  }
}
