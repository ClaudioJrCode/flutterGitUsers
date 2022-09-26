import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_users/modules/home/presenter/screens/home_screen/widgets/center_text.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/bloc/user_details_bloc.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/bloc/user_details_state.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/widgets/user_details_card.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserDetailsBloc bloc;
  const UserDetailsScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Usuário'),
      ),
      body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
        bloc: bloc,
        builder: ((context, state) {
          switch (state.runtimeType) {
            case UserDetailScreenLoadingState:
              return const Center(child: CircularProgressIndicator());
            case UserDetailScreenErrorState:
              return const CenterText(
                  text: 'Ocorreu um erro ao carregar os detalhes do usuário');
            case UserDetailsScreenLoadedState:
              return UserDetailsCard(user: state.userDetails!);
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
