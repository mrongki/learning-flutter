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
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(todo: _todos[index])));
              },
            );
          }),
    );
  }
}

// DetailScreen
// takes in a single Todo object
class DetailScreen extends StatelessWidget {
  final Todo todo;
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title),),
      body: ListTile(
        title: Text(todo.description),
      ),
      
    );
  }
}
