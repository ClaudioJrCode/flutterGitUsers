import 'package:flutter/material.dart';
import 'package:git_users/modules/user/domain/entities/user_entity.dart';

import 'package:git_users/modules/user/domain/usecases/get_user_usecase.dart';
import 'package:git_users/modules/user/presenter/screens/search_history_screen.dart';
import 'package:git_users/modules/user/presenter/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final IGetUserUseCase useCase;

  const HomeScreen({
    Key? key,
    required this.title,
    required this.useCase,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserEntity> _users = [];

  _goToHistoryScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SearchHistoryScreen()));
  }

  Future<void> _getUsers(String search) async {
    if (search.isNotEmpty) {
      final response = await widget.useCase.getUsers(search: search);
      if (response.isSuccess) {
        setState(() {
          _users = response.value!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBar(onSubmitted: _getUsers),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.separated(
                    itemBuilder: (context, int index) => ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            _users[index].avatar,
                          ),
                        ),
                        title: Text(_users[index].name)),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: _users.length),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToHistoryScreen,
        tooltip: 'Listar Pesquisas',
        child: const Icon(
          Icons.list,
          size: 30,
        ),
      ),
    );
  }
}
