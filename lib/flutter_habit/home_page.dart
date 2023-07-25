import 'package:flutter/material.dart';
import 'package:flutter_practice/flutter_habit/flutter_habit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Consistency is key'),
      ),
      body: Column(
        children: [
          HabitTile(
              habitName: 'Exercise',
              ontap: () {},
              settings: () {},
              timeSpend: 0,
              timeGoal: 0,
              isHabitStarted: false)
        ],
      ),
    );
  }
}
