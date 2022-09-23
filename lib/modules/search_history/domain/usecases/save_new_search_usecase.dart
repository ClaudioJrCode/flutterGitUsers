import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';
import 'package:git_users/modules/search_history/domain/repositories/search_history_repository_interface.dart';

import '../../../../core/exceptions/result.dart';

abstract class ISaveNewSearchUseCase {
  Future<Result<Failure, void>> saveSearch(
      {required SearchHistoryEntity search});
}

class SaveNewSearchUseCase implements ISaveNewSearchUseCase {
  final ISearchHistoryRepository repository;
  SaveNewSearchUseCase({
    required this.repository,
  });
  @override
  Future<Result<Failure, void>> saveSearch(
      {required SearchHistoryEntity search}) async {
    return await repository.saveSearchHistory(search: search);
  }
}
