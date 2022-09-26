import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_users/core/adapters/injector/injector.dart';
import 'package:git_users/modules/home/domain/usecases/get_user_usecase.dart';
import 'package:git_users/modules/home/presenter/screens/home_screen/home_screen_bloc/home_screen_event.dart';
import 'package:git_users/modules/home/presenter/screens/home_screen/home_screen_bloc/home_screen_state.dart';
import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';
import 'package:git_users/modules/search_history/domain/usecases/save_new_search_usecase.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_bloc.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_event.dart';
import 'package:git_users/modules/search_history/presenter/search_history_screen.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final StreamController<String> _searchController = StreamController<String>();
  final IGetUserUseCase getUserUseCase;
  final ISaveNewSearchUseCase saveSearchUseCase;
  final TextEditingController textController = TextEditingController();

  Stream<String> get outSearch => _searchController.stream;
  Function(String) get inSearch => _searchController.sink.add;

  HomeScreenBloc({
    HomeScreenState? initialState,
    required this.getUserUseCase,
    required this.saveSearchUseCase,
  }) : super(HomeScreenStateIdle()) {
    on<FetchUsersListEvent>((event, emit) =>
        _initSearch(search: event.search, emit: emit, save: true));

    on<InitOldSearchEvent>(
        (event, emit) => _initSearch(search: event.search, emit: emit));
  }
  Future<void> _initSearch(
      {required String search,
      required Emitter<HomeScreenState> emit,
      bool save = false}) async {
    emit(HomeScreenStateLoading());
    final res = await getUserUseCase.getUsers(search: search);
    if (res.isError) {
      emit(HomeScreenStateError());
      return;
    }
    if (res.value!.isNotEmpty) {
      emit(HomeScreenStateLoaded(users: res.value!));
      if (save) _saveSearch(search);
    } else {
      emit(HomeScreenStateEmptyList());
    }
  }

  void _saveSearch(String search) {
    saveSearchUseCase.saveSearch(
        search: SearchHistoryEntity(
            search: search,
            id: UniqueKey().toString(),
            searchDate: DateTime.now()));
  }

  Future<void> goToSearchHistoryScreen(BuildContext context) async {
    final String? futureSearch = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchHistoryScreen(
            bloc: I.getDependency<SearchHistoryBloc>()
              ..add(FetchingSearchListEvent())),
      ),
    );
    if (futureSearch != null) {
      textController.text = futureSearch;
      add(InitOldSearchEvent(search: futureSearch));
    }
  }
}
