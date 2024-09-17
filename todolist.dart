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
                    DetailScreen(todo: _todos[index])
                )
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _todos.removeAt(index);
                });
              },
            ),
          );
        }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final Todo? newTodo = await showDialog<Todo>(
            context: context,
            builder: (BuildContext context) {
              String? title;
              String? description;
              return AlertDialog(
                title: const Text('Create New Todo'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (value) => title = value,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                      onChanged: (value) => description = value,
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () {
                      if (title != null && description != null) {
                        Navigator.pop(context, Todo(title!, description!));
                      }
                    }
                  ),
                ],
              );
            }
          );
          if (newTodo != null) {
            setState(() {
              _todos.add(newTodo);
            });
          }
        },
      ),
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
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: ListTile(
        title: Text(todo.description),
      ),
    );
  }
}
