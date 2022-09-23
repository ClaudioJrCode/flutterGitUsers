import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_users/modules/home_screen/presenter/screens/home_screen/home_screen_bloc/home_screen_bloc.dart';
import 'package:git_users/modules/home_screen/presenter/screens/home_screen/home_screen_bloc/home_screen_event.dart';
import 'package:git_users/modules/home_screen/presenter/screens/home_screen/widgets/center_text.dart';
import 'package:git_users/modules/home_screen/presenter/screens/home_screen/widgets/search_bar/search_bar.dart';
import 'package:git_users/modules/home_screen/presenter/screens/home_screen/widgets/users_list/users_list.dart';

import 'home_screen_bloc/home_screen_state.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenBloc bloc;
  const HomeScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Git Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBar(
              textController: bloc.textController,
              stream: bloc.outSearch,
              onChaged: bloc.inSearch,
              onSubmitted: (value) =>
                  bloc.add(FetchUsersListEvent(search: value)),
            ),
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
              bloc: bloc,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case HomeScreenStateLoading:
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case HomeScreenStateEmptyList:
                    return const CenterText(text: 'Nenhum Usuário Encontrado');
                  case HomeScreenStateError:
                    return const CenterText(text: 'Houve um erro na busca!');
                  case HomeScreenStateLoaded:
                    return UsersList(users: state.users);
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.goToSearchHistoryScreen(context),
        tooltip: 'Listar Pesquisas',
        child: const Icon(
          Icons.list,
          size: 30,
        ),
      ),
    );
  }
}
