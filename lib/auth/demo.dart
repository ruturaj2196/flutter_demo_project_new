import 'package:flutter/material.dart';
import 'package:flutter_practice/login_page/text_field.dart';
import 'package:intl/intl.dart';

class DateCheck extends StatefulWidget {
  const DateCheck({super.key});

  @override
  State<DateCheck> createState() => _DateCheckState();
}

class _DateCheckState extends State<DateCheck> {
  // final TextEditingController _fromdateController = TextEditingController();
  final TextEditingController _todateController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  String fromDate = '';
  String toDate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date check')),
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InputField(
            //   ontap: () {
            //     setState(() {
            //       _fromDate(context);
            //     });
            //   },
            //   obsecureText: false,
            //   controller: _fromdateController,
            //   hintText: 'yyyy-mm-dd',
            //   readOnly: true,
            // ),
            InputField(
              ontap: () {
                setState(() {
                  _toDate(context);
                });
              },
              readOnly: true,
              obsecureText: false,
              controller: _todateController,
              hintText: 'yyyy-mm-dd',
            ),
            const SizedBox(
              height: 10,
            ),
            Builder(builder: (context) {
              if (_checkDates() == true) {
                return Text('Date $fromDate to $toDate is in correct range');
              } else {
                return const Text(' date range is incorrect..!!');
              }
            }),
          ],
        ),
      ),
    );
  }

  bool _checkDates() {
    DateTime fromDateTime = DateTime.parse(fromDate);
    DateTime toDateTime = DateTime.parse(toDate);
    return fromDateTime.isBefore(toDateTime);
  }

// Calendar for from date
  // _fromDate(BuildContext context) async {
  //   final now = DateTime.now();
  //   final DateTime? fromPicked = await showDatePicker(
  //       initialEntryMode: DatePickerEntryMode.calendar,
  //       initialDatePickerMode: DatePickerMode.day,
  //       context: context,
  //       initialDate: DateTime(now.year, now.month, 1),
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2200));

  //   if (fromPicked != null) {
  //     debugPrint(fromPicked.toString());
  //     setState(() {
  //       _fromdateController.text = DateFormat('yyyy-MM-dd').format(fromPicked);
  //       fromDate = _fromdateController.text;
  //     });
  //   } else {
  //     debugPrint('not selected..');
  //   }
  // }

// Calendar for to date
  _toDate(BuildContext context) async {
    final DateTime? toPicked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2200));
    if (toPicked != null) {
      debugPrint(toPicked.toString());
      setState(() {
        _todateController.text = DateFormat('yyyy-MM-dd').format(toPicked);
        toDate = _todateController.text;
      });
    } else {
      debugPrint('not selected..');
    }
  }
}
