import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class dailogBox extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCacel;
  final controller;
  const dailogBox({
    super.key,
    required this.onSave,
    required this.onCacel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Enter To Do Item', border: OutlineInputBorder()),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            myButtton(
              text: 'Save',
              onPressed: onSave,
            ),
            const SizedBox(
              width: 20,
            ),
            myButtton(
              text: 'Cancel',
              onPressed: onCacel,
            ),
          ],
        )
      ],
    );
  }
}
