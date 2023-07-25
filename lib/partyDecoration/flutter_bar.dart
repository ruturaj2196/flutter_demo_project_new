import 'package:flutter/material.dart';
import 'package:flutter_practice/partyDecoration/expense_summary.dart';
import 'package:flutter_practice/partyDecoration/expense_tile.dart';
import 'package:flutter_practice/partyDecoration/hive_database.dart';
import 'package:provider/provider.dart';

class FlutterBar extends StatefulWidget {
  const FlutterBar({super.key});

  @override
  State<FlutterBar> createState() => _FlutterBarState();
}

class _FlutterBarState extends State<FlutterBar> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    // prepare the data in startup
    Provider.of<ExpenseData>(context, listen: false).prepareData;
    super.initState();
  }

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent[100],
            ),
            onPressed: save,
            child: const Text('Save'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
            ),
            onPressed: cancel,
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        title: const Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: newExpenseNameController,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: newExpenseAmountController,
            ),
          ],
        ),
      ),
    );
  }

  void clear() {
    newExpenseAmountController.clear();
    newExpenseNameController.clear();
  }

  void save() {
    if (newExpenseNameController.text.isNotEmpty &&
        newExpenseAmountController.text.isNotEmpty) {
      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now(),
      );
      Provider.of<ExpenseData>(context, listen: false)
          .addNewExpense(newExpense);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Expense saved successfully !')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Expense not saved !'),
        ),
      );
    }

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (ctx, value, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.redAccent,
          title: const Text('Flutter bar indicator'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: addNewExpense,
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              ExpenseSummary(startOfWeek: value.startOfTheWeek()),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ExpenseTile(
                      name: value.getAllExpenseList()[index].name,
                      amount: value.getAllExpenseList()[index].amount,
                      dateTime: value.getAllExpenseList()[index].dateTime,
                      onPressed: (p0) =>
                          Provider.of<ExpenseData>(context, listen: false)
                              .deleteExpense(
                        value.getAllExpenseList()[index],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseItem {
  final String name;
  final String amount;
  final DateTime dateTime;

  ExpenseItem({
    required this.name,
    required this.amount,
    required this.dateTime,
  });
}

class ExpenseData extends ChangeNotifier {
  // list of all expenses
  List<ExpenseItem> overallExpenseList = [];

  // get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  // prepare data display
  final db = HiveDataBase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
    // if there exists data get it
  }

  // add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // remove expense
  void deleteExpense(ExpenseItem removeExpense) {
    overallExpenseList.remove(removeExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // get weekdays from dateTime Object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

// get the date for the start of the week
  DateTime startOfTheWeek() {
    DateTime? startOfWeek;

    // get todays date
    DateTime today = DateTime.now();

    // go backwards from today to find sunday

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}

// convert dateTime object to a string yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0' + month;
  }
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0' + day;
  }
  String yyyymmdd = year + month + day;
  return yyyymmdd;
}
