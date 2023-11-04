import 'package:flutter/material.dart';
import 'package:sample/new_todo_dialog.dart';
import 'package:sample/todo.dart';
import 'package:sample/todo_list.dart';

class TodoListScreen extends StatefulWidget
{
  @override
  TodoListScreenState createState() => TodoListScreenState();
}

class TodoListScreenState extends State<TodoListScreen>
{
  List<Todo> todos = [];
  _toggleTodo(Todo todo, bool? isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(context: context, builder: (BuildContext context) {
      return NewTodoDialog();
    });

    if(todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Todo App')),
      body: TodoList(
        todos:todos,
        onTodoToggle:_toggleTodo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}