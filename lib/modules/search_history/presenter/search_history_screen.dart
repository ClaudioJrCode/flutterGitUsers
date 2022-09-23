import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_users/modules/home_screen/presenter/screens/home_screen/widgets/users_list/custom_divider.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_bloc.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_event.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_state.dart';
import 'package:git_users/modules/search_history/presenter/widgets/search_tile.dart';
import '../../../core/adapters/injector/injector.dart';

class SearchHistoryScreen extends StatelessWidget {
  const SearchHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = I.getDependency<SearchHistoryBloc>();
    bloc.add(FetchingSearchList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de busca'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
          bloc: bloc,
          builder: (BuildContext context, state) {
            return ListView.separated(
                itemBuilder: ((context, index) => SearchTile(
                      search: state.searchs[index],
                      onTap: () => bloc.add(SelectedSearch(
                          context: context,
                          search: state.searchs[index].search)),
                    )),
                separatorBuilder: (_, __) => const CustomDivider(),
                itemCount: state.searchs.length);
          },
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () => Navigator.of(context).pop('ClaudioJrCode'),
          icon: const Icon(Icons.add)),
    );
  }
}
