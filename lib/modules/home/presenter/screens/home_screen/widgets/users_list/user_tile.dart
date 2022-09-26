import 'package:flutter/material.dart';
import 'package:git_users/modules/home/domain/entities/user_entity.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/bloc/user_details_bloc.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/bloc/user_details_event.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/user_details_screen.dart';

import '../../../../../../../core/adapters/injector/injector.dart';

class UserTile extends StatelessWidget {
  final UserEntity user;
  const UserTile({Key? key, required this.user}) : super(key: key);

  void _navigateToUserDetails(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => UserDetailsScreen(
            bloc: I.getDependency<UserDetailsBloc>()
              ..add(FetchUserDetailsEvent(userName: user.name))))));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => _navigateToUserDetails(context),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            user.avatar,
          ),
        ),
        title: Text(user.name));
  }
}
