import 'package:flutter/material.dart';
import 'package:sample/todo.dart';

/// definition delegate event
typedef ToggleTodoCallback = void Function(Todo, bool?);

class TodoList extends StatelessWidget {
  TodoList({required this.todos, required this.onTodoToggle});

  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return CheckboxListTile(value: todo.isDone,
        title: Text(todo.title),
        onChanged: (bool? isChecked) {
          onTodoToggle(todo, isChecked);
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemBuilder: _buildItem, itemCount: todos.length,);
  }

}