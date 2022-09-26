import 'package:flutter/material.dart';

const String hint = "Buscar usuários";

class SearchBar extends StatelessWidget {
  final Function(String) onSubmitted;
  final Stream<String> stream;
  final Function(String) onChaged;
  final TextEditingController textController;

  const SearchBar(
      {super.key,
      required this.onSubmitted,
      required this.stream,
      required this.onChaged,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            controller: textController,
            onChanged: onChaged,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: hint,
            ),
            autocorrect: false,
            onSubmitted: onSubmitted,
          );
        });
  }
}
