import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/stateManagement/provider/todo_provider.dart';
import 'package:flutter_practice/stateManagement/class.dart';

import 'package:provider/provider.dart';

class MyProviderApp extends StatefulWidget {
  const MyProviderApp({super.key});

  @override
  State<MyProviderApp> createState() => _MyProviderAppState();
}

class _MyProviderAppState extends State<MyProviderApp> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void clearText() {
    _emailController.clear();
    _idController.clear();
    _phoneController.clear();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('sdadsad');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Consumer<TodoProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // final todos = value.todos;
                return DropdownSearch<Subscribers>(
                  itemAsString: (Subscribers item) {
                    return item.emailaddress.toString();
                  },
                  items: value.todos,
                  onChanged: (Subscribers? item) {
                    if (item != null) {
                      debugPrint(item.id.toString());
                      // Handle item selection
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add new subscriber'),
            ),
          ],
        ),
      ),
    );
  }
}

void customAlertDailog(
  BuildContext context,
  String text,
  Widget content,
  final Function() onPressed,
  String buttonText,
) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(text),
          content: content,
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        );
      });
}
