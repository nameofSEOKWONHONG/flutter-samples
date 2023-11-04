import 'package:flutter/material.dart';
import 'package:sample/todo.dart';

class NewTodoDialog extends StatelessWidget {
  final controller = TextEditingController();

  NewTodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: const Text("New todo"),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: <Widget>[
        FloatingActionButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        FloatingActionButton(
            child: const Text("Add"),
            onPressed: () {
              if(controller.value.text.isEmpty) {
                return;
              }

              final todo = Todo(controller.value.text, false);
              controller.clear();

              Navigator.of(context).pop(todo);
            })
      ],
    );
  }

}