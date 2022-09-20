import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSubmitted;

  const SearchBar({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        hintText: 'Buscar usuários',
      ),
      autocorrect: false,
      onSubmitted: onSubmitted,
    );
  }
}
