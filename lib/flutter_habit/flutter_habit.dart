import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatefulWidget {
  final String habitName;
  final VoidCallback ontap;
  final VoidCallback settings;
  final int timeSpend;
  final int timeGoal;
  final bool isHabitStarted;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.ontap,
      required this.settings,
      required this.timeSpend,
      required this.timeGoal,
      required this.isHabitStarted});

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //progress indicator
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Stack(children: [
                    CircularPercentIndicator(
                      radius: 30,
                    ),
                    Center(
                        child: Icon(widget.isHabitStarted
                            ? Icons.pause
                            : Icons.play_arrow)),
                  ]),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.habitName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text('2:00 / 10 = 20%'),
                  ],
                ),
              ],
            ),

            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
