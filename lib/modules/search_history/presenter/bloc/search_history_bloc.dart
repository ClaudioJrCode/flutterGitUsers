import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:git_users/modules/search_history/domain/usecases/get_search_history_usecase.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_event.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final IGetSearchHistoryUseCase useCase;
  SearchHistoryBloc({required this.useCase}) : super(SearchHistoryStateIdle()) {
    on<FetchingSearchList>((event, emit) => _initialize(emit));
    on<SelectedSearch>((event, emit) =>
        _goBackWithSearchChoosed(search: event.search, context: event.context));
  }
  void _initialize(Emitter<SearchHistoryState> emit) {
    final res = useCase.getSearchHistory();
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
}
