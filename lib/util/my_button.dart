import 'package:flutter/material.dart';

class myButtton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const myButtton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}
