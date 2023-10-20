import 'package:flutter/material.dart';
import 'package:todo_list_with_storage/utils/app_button.dart';

class DialogBox extends StatelessWidget {
  // text field controller
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: SizedBox(
        height: 120,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              autofocus: true,
              maxLength: 20,
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Your Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  title: "Add",
                  backgroundColor: const Color.fromARGB(255, 79, 145, 82),
                  textColor: Colors.white,
                  onPressed: onSave,
                ),
                const SizedBox(width: 10), // add some space between the buttons
                AppButton(
                  title: "Cancel",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
