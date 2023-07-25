import 'package:flutter/material.dart';
import 'package:flutter_practice/partyDecoration/bar_graph.dart';
import 'package:flutter_practice/partyDecoration/flutter_bar.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({super.key, required this.startOfWeek});

  // calculate max amount in bar graph
  double calculateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    values.sort();
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  // calculate the week total

  String calculateWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
        builder: (ctx, value, child) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Week Total: ${calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}'),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: MyBarGraph(
                      maxY: calculateMax(value, sunday, monday, tuesday,
                          wednesday, thursday, friday, saturday),
                      sunday: value.calculateDailyExpenseSummary()[sunday] ?? 0,
                      monday: value.calculateDailyExpenseSummary()[monday] ?? 0,
                      tuesday:
                          value.calculateDailyExpenseSummary()[tuesday] ?? 0,
                      wednesday:
                          value.calculateDailyExpenseSummary()[wednesday] ?? 0,
                      thursday:
                          value.calculateDailyExpenseSummary()[thursday] ?? 0,
                      friday: value.calculateDailyExpenseSummary()[friday] ?? 0,
                      saturday:
                          value.calculateDailyExpenseSummary()[saturday] ?? 0),
                ),
              ],
            ));
  }
}

// individual bar
class IndividualBar {
  final int x;
  final double y;
  IndividualBar({
    required this.x,
    required this.y,
  });
}

class BarData {
  final double sunday;
  final double monday;
  final double tuesday;
  final double wednesday;
  final double thursday;
  final double friday;
  final double saturday;
  BarData({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  List<IndividualBar> barData = [];

  // initialsze bar data
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunday),
      IndividualBar(x: 1, y: monday),
      IndividualBar(x: 2, y: tuesday),
      IndividualBar(x: 3, y: wednesday),
      IndividualBar(x: 4, y: thursday),
      IndividualBar(x: 5, y: friday),
      IndividualBar(x: 6, y: saturday),
    ];
  }
}
