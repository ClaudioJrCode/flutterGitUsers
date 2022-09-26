import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_users/modules/home/presenter/screens/home_screen/widgets/center_text.dart';
import 'package:git_users/modules/home/presenter/screens/home_screen/widgets/users_list/custom_divider.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_bloc.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_event.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_state.dart';
import 'package:git_users/modules/search_history/presenter/widgets/search_tile.dart';

class SearchHistoryScreen extends StatelessWidget {
  final SearchHistoryBloc bloc;
  const SearchHistoryScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de busca'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
          bloc: bloc,
          builder: (BuildContext context, state) {
            switch (state.runtimeType) {
              case SearchHistoryStateIdle:
                {
                  return const Center(child: CircularProgressIndicator());
                }

              case SearchHistoryStateEmptyList:
                {
                  return const CenterText(
                      text: 'Ainda não foi feita nenhuma busca');
                }
              case SearchHistoryStateError:
                {
                  return const CenterText(text: 'Ocorreu um erro');
                }
              case SearchHistoryStateLoaded:
                {
                  return ListView.separated(
                      itemBuilder: ((context, index) => SearchTile(
                            search: state.searchs[index],
                            onTap: () => bloc.add(
                              SelectedSearchEvent(
                                  context: context,
                                  search: state.searchs[index].search),
                            ),
                            onPressDelete: () => bloc.add(DeleteASearchEvent(
                                search: state.searchs[index])),
                          )),
                      separatorBuilder: (_, __) => const CustomDivider(),
                      itemCount: state.searchs.length);
                }
              default:
                {
                  return Container();
                }
            }
          },
        ),
      ),
    );
  }
}
