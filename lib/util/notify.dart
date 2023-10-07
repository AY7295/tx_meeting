import 'package:flutter/material.dart';

void showAlert({
  required BuildContext context,
  required String content,
  String? title,
  TextStyle? style,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title ?? 'Tip',
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        style: style ??
            TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.check, size: 40),
        ),
      ],
    ),
  );
}
