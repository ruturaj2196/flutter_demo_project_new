import 'package:flutter/material.dart';
import 'package:flutter_practice/dattamob/shadow_account.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  await Hive.openBox("expense_database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DataProvider(),
          builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const ShadowAccount(),
          ),
        ),
      ],
    );
  }
}
