import 'package:flutter/material.dart';
import 'package:git_users/modules/home/domain/entities/user_entity.dart';
import 'package:git_users/modules/home/presenter/screens/home_screen/widgets/users_list/user_tile.dart';

import 'custom_divider.dart';

class UsersList extends StatelessWidget {
  final List<UserEntity> users;
  const UsersList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, int index) => UserTile(user: users[index]),
          separatorBuilder: (_, __) => const CustomDivider(),
        ),
      ),
    );
  }
}
