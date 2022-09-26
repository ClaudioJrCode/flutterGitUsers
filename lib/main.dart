import 'package:flutter/material.dart';
import 'package:git_users/core/dependencies/init.dart';
import 'package:git_users/modules/home/presenter/screens/home_screen/home_screen_bloc/home_screen_bloc.dart';
import 'core/adapters/injector/injector.dart';
import 'modules/home/presenter/screens/home_screen/home_screen.dart';

void main() {
  initAllDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Users',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(
        bloc: I.getDependency<HomeScreenBloc>(),
      ),
    );
  }
}
