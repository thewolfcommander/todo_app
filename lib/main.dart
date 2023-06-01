import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todoList = [];

  void _addTodoItem(String title) {
    // only add the task if the user actually entered something
    if (title.isNotEmpty) {
      setState(() {
        _todoList.add(title);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todoList[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _promptAddTodoItem(),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _promptAddTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter a task to-do'),
          content: TextField(
            onSubmitted: (value) {
              _addTodoItem(value);
              Navigator.pop(context); // close the add todo dialog
            },
          ),
        );
      },
    );
  }
}
