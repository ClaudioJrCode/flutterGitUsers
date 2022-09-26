import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  final String text;
  const CenterText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
