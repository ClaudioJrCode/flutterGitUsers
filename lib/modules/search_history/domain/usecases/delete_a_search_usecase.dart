import 'package:git_users/core/exceptions/exception.dart';
import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';
import 'package:git_users/modules/search_history/domain/repositories/search_history_repository_interface.dart';

import '../../../../core/exceptions/result.dart';

abstract class IDeleteASearchUseCase {
  Future<Result<Failure, void>> deleteASearch(SearchHistoryEntity search);
}

class DeleteASearchUseCase implements IDeleteASearchUseCase {
  final ISearchHistoryRepository repository;
  DeleteASearchUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, void>> deleteASearch(
      SearchHistoryEntity search) async {
    return await repository.deleteASearch(search: search);
  }
}
