import 'package:flutter/material.dart';
import 'package:flutter_practice/stateManagement/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class MyProviderApp extends StatefulWidget {
  const MyProviderApp({super.key});

  @override
  State<MyProviderApp> createState() => _MyProviderAppState();
}

class _MyProviderAppState extends State<MyProviderApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Provider'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final todos = value.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (ctx, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.ac_name),
                subtitle: Text(todo.doc_date),
                leading: Text(todo.amount),
              );
            },
          );
        },
      ),
    );
  }
}
