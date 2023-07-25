import 'package:flutter_practice/partyDecoration/flutter_bar.dart';
import 'package:hive/hive.dart';

class HiveDataBase {
  // reference our box
  final _myBox = Hive.box('expense_database');
  // write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpensesFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }
    _myBox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];
    for (int i = 0; i < savedExpenses.length; i++) {
      // collect the individual exp data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      ExpenseItem expense =
          ExpenseItem(name: name, amount: amount, dateTime: dateTime);

      allExpenses.add(expense);
    }

    return allExpenses;
  }

  // read data
}
