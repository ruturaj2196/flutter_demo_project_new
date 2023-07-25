import 'package:flutter/material.dart';
import 'package:flutter_practice/auth/new_provider.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
      builder: (ctx, numbersProviderModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('horizontal view'),
        ),
        body: Column(
          children: [
            Text(
              'Print last number:  ${numbersProviderModel.number.last.toString()}',
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numbersProviderModel.number.length,
                itemBuilder: (context, snapshot) {
                  return SizedBox(
                    width: 50,
                    height: 30,
                    child: Card(
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
