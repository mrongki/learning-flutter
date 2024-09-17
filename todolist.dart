import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> _todos = [
  Todo('Item one', 'Take out the trash'),
  Todo('Item two', 'Paint the wall'),
];

void main() {
  runApp(MaterialApp(title: 'todoApp', home: TodosScreen(todos: _todos)));
}

class TodosScreen extends StatefulWidget {
  final List<Todo> todos;
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  //initial variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks'),),
      body: ,
    );
  }
}
