import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/stateManagement/provider/todo_provider.dart';
import 'package:flutter_practice/stateManagement/services/todo_services.dart';
import 'package:flutter_practice/stateManagement/todo.dart';

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
              onPressed: () {
                customAlertDailog(
                  context,
                  'Add new subscriber.',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Id',
                          hintStyle: const TextStyle(fontSize: 13),
                        ),
                        controller: _idController,
                        readOnly: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'E-mail',
                          hintStyle: const TextStyle(fontSize: 13),
                        ),
                        controller: _emailController,
                        readOnly: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: '+91',
                          hintStyle: const TextStyle(fontSize: 13),
                        ),
                        controller: _phoneController,
                        readOnly: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          if (value.contains(RegExp(r'[^\d]'))) {
                            return 'Invalid phone number';
                          }
                          return null; // Return null if the input is valid.
                        },
                      ),
                    ],
                  ),
                  () {
                    int id = int.parse(_idController.text);
                    int phoneNo = int.parse(_phoneController.text);
                    String email = _emailController.text;
                    setState(() {
                      TodoService().postIntoSubscriberTableData(
                        context,
                        id,
                        email,
                        phoneNo,
                      );
                      clearText();
                      Navigator.pop(context);
                    });
                  },
                  'Save',
                );
              },
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
