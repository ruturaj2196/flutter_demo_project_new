import 'package:flutter/material.dart';
import 'package:flutter_practice/auth/new_provider.dart';
import 'package:flutter_practice/flash_screen/second.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
      builder: (ctx, numbersProviderModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('State management'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const Second(),
                  ),
                );
              },
              child: const Text('Second'),
            ),
          ],
        ),
        body: Column(
          children: [
            Text(
              'Print the last number: ${numbersProviderModel.number.last.toString()}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    numbersProviderModel.add();
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    numbersProviderModel.remove();
                  },
                  child: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: numbersProviderModel.number.length,
                itemBuilder: (context, snapshot) {
                  return Card(
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(
                        numbersProviderModel.number[snapshot].toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
