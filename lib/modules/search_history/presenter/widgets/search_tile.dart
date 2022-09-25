import 'package:flutter/material.dart';
import 'package:git_users/modules/search_history/domain/entities/search_history_entity.dart';
import 'package:intl/intl.dart';

class SearchTile extends StatelessWidget {
  final SearchHistoryEntity search;
  final void Function() onTap;
  final void Function() onPressDelete;
  const SearchTile(
      {Key? key,
      required this.search,
      required this.onTap,
      required this.onPressDelete})
      : super(key: key);

  String formatDate(DateTime date) {
    final formatter = DateFormat("dd/MM/yyyy - HH:mm");
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(style: const TextStyle(fontSize: 25), search.search),
          Text('Busca feita em: ${formatDate(search.searchDate)}'),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onPressDelete,
      ),
    );
  }
}
