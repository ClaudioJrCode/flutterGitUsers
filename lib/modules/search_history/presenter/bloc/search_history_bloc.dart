import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';
import 'package:git_users/modules/search_history/domain/usecases/delete_a_search_usecase.dart';

import 'package:git_users/modules/search_history/domain/usecases/get_search_history_usecase.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_event.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final IGetSearchHistoryUseCase useCase;
  final IDeleteASearchUseCase deleteUseCase;
  SearchHistoryBloc({required this.useCase, required this.deleteUseCase})
      : super(SearchHistoryStateIdle()) {
    on<FetchingSearchListEvent>((event, emit) => _initialize(emit));
    on<SelectedSearchEvent>((event, emit) =>
        _goBackWithSearchChoosed(search: event.search, context: event.context));

    on<DeleteASearchEvent>(((event, emit) => _deleteASearch(event.search)));
  }
  void _initialize(Emitter<SearchHistoryState> emit) async {
    final res = await useCase.getSearchHistory();
    if (res.isError) {
      emit(SearchHistoryStateError());
      return;
    }
    if (res.isSuccess && res.value!.isNotEmpty) {
      emit(SearchHistoryStateLoaded(searchs: res.value!));
    } else {
      emit(SearchHistoryStateEmptyList());
    }
  }

  void _goBackWithSearchChoosed(
      {required String search, required BuildContext context}) {
    Navigator.of(context).pop(search);
  }

  Future<void> _deleteASearch(SearchHistoryEntity search) async {
    await deleteUseCase.deleteASearch(search);
    add(FetchingSearchListEvent());
  }
}
