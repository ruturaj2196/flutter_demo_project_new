import 'package:flutter/material.dart';
import 'package:flutter_practice/stateManagement/services/todo_services.dart';
import 'package:flutter_practice/stateManagement/todo.dart';

class TodoProvider extends ChangeNotifier {
  bool isLoading = false;
  TodoService _service = TodoService();
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos = response;

    isLoading = false;
    notifyListeners(); 
  }
}
