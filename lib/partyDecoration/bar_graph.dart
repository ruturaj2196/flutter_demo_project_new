import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/partyDecoration/expense_summary.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunday;
  final double monday;
  final double tuesday;
  final double wednesday;
  final double thursday;
  final double friday;
  final double saturday;

  const MyBarGraph(
      {super.key,
      this.maxY,
      required this.sunday,
      required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunday: sunday,
        monday: monday,
        tuesday: tuesday,
        wednesday: wednesday,
        thursday: thursday,
        friday: friday,
        saturday: saturday);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      titlesData: const FlTitlesData(
        show: true,
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,
          ),
        ),
      ),
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: myBarData.barData
          .map((e) => BarChartGroupData(x: e.x, barRods: [
                BarChartRodData(
                  toY: e.y,
                  borderRadius: BorderRadius.circular(4),
                  width: 25,
                  color: Colors.redAccent,
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: const Color.fromARGB(154, 255, 139, 128)),
                ),
              ]))
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'W',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'F',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'S',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
