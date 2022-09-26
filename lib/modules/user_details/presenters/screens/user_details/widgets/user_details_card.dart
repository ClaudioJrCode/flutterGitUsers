import 'package:flutter/material.dart';
import 'package:git_users/modules/user_details/domain/entities/user_details_entity.dart';

class UserDetailsCard extends StatelessWidget {
  final UserDetailsEntity user;
  const UserDetailsCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          PhysicalModel(
            color: const Color.fromARGB(255, 84, 91, 135),
            borderRadius: BorderRadius.circular(8),
            shadowColor: Colors.black,
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      user.avatarUrl,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        const SizedBox(height: 10),
                        const Text('About me:',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 3),
                        Text(
                          user.bio,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
