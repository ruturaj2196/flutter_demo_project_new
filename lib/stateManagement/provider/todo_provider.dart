import 'package:flutter/material.dart';
import 'package:flutter_practice/stateManagement/services/todo_services.dart';
import 'package:flutter_practice/stateManagement/todo.dart';

class TodoProvider extends ChangeNotifier {
  bool isLoading = false;
  final TodoService _service = TodoService();
  List<Subscribers> _todos = [];
  List<Subscribers> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos = response;

    isLoading = false;
    notifyListeners();
  }
}
