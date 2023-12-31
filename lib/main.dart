import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/provider_for_adv_account/adv_acc_provider.dart';
import 'package:flutter_practice/provider_for_adv_account/adv_acc_ui.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize hive
  HttpOverrides.global = MyHttpOverrides();
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
        // ChangeNotifierProvider(
        //   create: (ctx) => TodoProvider(),
        //   builder: (context, child) => MaterialApp(
        //     title: 'Flutter Demo',
        //     debugShowCheckedModeBanner: false,
        //     theme: ThemeData(
        //       primarySwatch: Colors.blue,
        //     ),
        //     home: const MyProviderApp(),
        //   ),
        // ),
        ChangeNotifierProvider(
          create: (ctx) => AdvAccProvider(),
          builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const AdvAccount(),
          ),
        ),
      ],
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
