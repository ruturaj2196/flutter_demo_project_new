import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? onPressed;
  ExpenseTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.red,
            onPressed: onPressed,
            icon: Icons.delete,
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            padding: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.yellow,
            onPressed: onPressed,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
        ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(
          '${dateTime.day}/${dateTime.month}/${dateTime.year}',
        ),
        trailing: Text(amount),
      ),
    );
  }
}
