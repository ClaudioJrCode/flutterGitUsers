import 'package:flutter/material.dart';
import 'package:git_users/modules/home/domain/entities/user_entity.dart';

class UserTile extends StatelessWidget {
  final UserEntity user;
  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            user.avatar,
          ),
        ),
        title: Text(user.name));
  }
}
