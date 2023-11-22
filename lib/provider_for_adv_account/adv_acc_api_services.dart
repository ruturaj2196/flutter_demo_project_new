import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/provider_for_adv_account/adv_acc_class.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ShadowAccountClass>> fetchShadowAccountList(
      BuildContext ctx, String accountScheduleId) async {
    // method to decode json data

    var url =
        'https://erpx.datta-india.co.in:8081/account/advacc/account-data?accountScheduleId=$accountScheduleId';
    debugPrint(url);
    try {
      final response = await http.get(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOlt7ImlkIjoiOWE4NGM5NWVlOWM3NDkwY2FiZjVhZDU0ZmU4ZjA2MjMiLCJjb2RlIjoiMDQtMDEtMDAwMDAyICAgIiwiZW1wbG95ZWV0eXBlX2lkIjoiNDAyODliODE1YjM3NWEyYjAxNWIzNzY0MDNjODAwMDEiLCJlbXBsb3llZWRlcGFydG1lbnRfaWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3NjZhNTgyMDAwOCIsImVtcGxveWVlZGVzaWduYXRpb25faWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3Njg0Njg0MDAwZiIsImJpcnRoZGF0ZSI6IjE5OTMtMTAtMThUMTg6MzA6MDAuMDAwWiIsImhvbm9yaWZpYyI6Ik1pc3MgICAgICAiLCJsYXN0bmFtZSI6Ik1BTkUiLCJmaXJzdG5hbWUiOiJST0hJTkkiLCJtaWRkbGVuYW1lIjoiUFJBS0FTSCAiLCJjdXJyZW50YWRkcmVzczEiOiJTYW5nYXdhZGUgIiwiY3VycmVudGFkZHJlc3MyIjoiU2FuZ2F3YWRlIiwiY3VycmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsImN1cnJlbnRwaW4iOjQxNjIwMiwiY3VycmVudHN0YXRlIjoiTWFoYXJhc2h0cmEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLCJwZXJtYW5lbnRhZGRyZXNzMSI6IlNhbmdhd2FkZSAiLCJwZXJtYW5lbnRhZGRyZXNzMiI6IlNhbmdhd2FkZSIsInBlcm1hbmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsInBlcm1hbmVudHBpbiI6NDE2MjAyLCJwZXJtYW5lbnRzdGF0ZSI6Ik1haGFyYXNodHJhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwicXVhbGlmaWNhdGlvbiI6IkJFICggIENTRSkiLCJkYXRlb2Zqb2luaW5nIjoiMjAyMi0wMi0wOVQxODozMDowMC4wMDBaIiwiZGF0ZW9mbGVhdmluZyI6bnVsbCwiZXBmbnVtYmVyIjoiIiwiZnBmbnVtYmVyIjoiIiwicGFubnVtYmVyIjoiRFBFUE05ODQ5SyIsImFhZGhhcm51bWJlciI6IjY1OTk4MTQxODE5MyIsImJhbmthY2NvdW50bnVtYmVyIjoiMCIsImJhbmtuYW1lIjoiSURCSSIsImVtYWlsIjoicm9oaW5pbWFuZTI5NUBnbWFpbC5jb20iLCJwaG9uZW51bWJlciI6IiIsIm1vYmlsZSI6Ijg3ODg4NDgzMDQiLCJjb21wYW55X2lkIjoiNDAyOGI4ODE1MWQyZTgxMDAxNTFkMmZkYzEyNDAwMDAiLCJuZXh0b2ZraW5uYW1lIjoiVmlzaGFsIE1hbmUiLCJiYW5raWZzY2NvZGUiOiIiLCJuZXh0b2ZraW5hZGRyZXNzIjpudWxsLCJuZXh0b2ZraW5lbWFpbCI6bnVsbCwibmV4dG9ma2lucGhvbmUiOiI4MzkwMDIxMjY3IiwibmV4dG9ma2lucmVsYXRpb253aXRoZW1wbG95ZWUiOiJCcm90aGVyICIsImVtcHByb2ZpbGVtZG9jaWQiOiI2MzI5NDlmYTA3ZDkyNjZjMmI2MWYxZDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiYWRoYXJjYXJkbWRvY2lkIjoiNjMyNTlmYTFmZjg3ODBmZTc5ZTZjMWQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIsInBhbmNhcmRtZG9jaWQiOiI2MzI1OWZiZmZmODc4MGZlNzllNmMxZDkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiZW1wbG95ZWV1c2VybmFtZSI6InJvaGluaSAgICAgICAgICAgICAgIn1dLCJpYXQiOjE2ODc0MTAzMjh9.T-Icre_mbMDHwEj_lTCCK1wP2K38Vg_c6wWy1TedJZ4"
        },
        Uri.parse(url),
      );
      // response.body is String
      if (response.statusCode == 200) {
        final data =
            jsonDecode(response.body) as List; //converted to dynamic list
        final accountList = data.map((e) {
          return ShadowAccountClass(
            id: e['id'],
            name: e['name'],
          );
        }).toList();
        return accountList;
      } else {
        throw Exception("Fail to load data !");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      dialog(
        ctx,
        Icons.error,
        Colors.red,
        e.toString(),
      );
      throw e.toString();
    }
  }

  void dialog(BuildContext context, IconData icon, Color colors, String error) {
    showDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 40,
              color: colors,
            ),
            Text('$error !')
          ],
        ),
      ),
    );
  }

// API call to POST new subscriber
  Future postIntoAdvAccData(
    String accountId,
    String accountScheduleId,
    String accountName,
    BuildContext context,
  ) async {
    try {
      print('$accountId, $accountName');
      // var url = Uri.parse(
      //   "https://erpx.datta-india.co.in:8081/account/advacc/addaccount-data",
      // );
      // debugPrint(
      //     "$accountId,.........$accountName.........$accountScheduleId................this the data.");
      // final response = await http.post(
      //   url,
      //   headers: {
      //     'Content-type': 'application/json; charset=UTF-8',
      //     "Authorization":
      //         "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOlt7ImlkIjoiOWE4NGM5NWVlOWM3NDkwY2FiZjVhZDU0ZmU4ZjA2MjMiLCJjb2RlIjoiMDQtMDEtMDAwMDAyICAgIiwiZW1wbG95ZWV0eXBlX2lkIjoiNDAyODliODE1YjM3NWEyYjAxNWIzNzY0MDNjODAwMDEiLCJlbXBsb3llZWRlcGFydG1lbnRfaWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3NjZhNTgyMDAwOCIsImVtcGxveWVlZGVzaWduYXRpb25faWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3Njg0Njg0MDAwZiIsImJpcnRoZGF0ZSI6IjE5OTMtMTAtMThUMTg6MzA6MDAuMDAwWiIsImhvbm9yaWZpYyI6Ik1pc3MgICAgICAiLCJsYXN0bmFtZSI6Ik1BTkUiLCJmaXJzdG5hbWUiOiJST0hJTkkiLCJtaWRkbGVuYW1lIjoiUFJBS0FTSCAiLCJjdXJyZW50YWRkcmVzczEiOiJTYW5nYXdhZGUgIiwiY3VycmVudGFkZHJlc3MyIjoiU2FuZ2F3YWRlIiwiY3VycmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsImN1cnJlbnRwaW4iOjQxNjIwMiwiY3VycmVudHN0YXRlIjoiTWFoYXJhc2h0cmEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLCJwZXJtYW5lbnRhZGRyZXNzMSI6IlNhbmdhd2FkZSAiLCJwZXJtYW5lbnRhZGRyZXNzMiI6IlNhbmdhd2FkZSIsInBlcm1hbmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsInBlcm1hbmVudHBpbiI6NDE2MjAyLCJwZXJtYW5lbnRzdGF0ZSI6Ik1haGFyYXNodHJhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwicXVhbGlmaWNhdGlvbiI6IkJFICggIENTRSkiLCJkYXRlb2Zqb2luaW5nIjoiMjAyMi0wMi0wOVQxODozMDowMC4wMDBaIiwiZGF0ZW9mbGVhdmluZyI6bnVsbCwiZXBmbnVtYmVyIjoiIiwiZnBmbnVtYmVyIjoiIiwicGFubnVtYmVyIjoiRFBFUE05ODQ5SyIsImFhZGhhcm51bWJlciI6IjY1OTk4MTQxODE5MyIsImJhbmthY2NvdW50bnVtYmVyIjoiMCIsImJhbmtuYW1lIjoiSURCSSIsImVtYWlsIjoicm9oaW5pbWFuZTI5NUBnbWFpbC5jb20iLCJwaG9uZW51bWJlciI6IiIsIm1vYmlsZSI6Ijg3ODg4NDgzMDQiLCJjb21wYW55X2lkIjoiNDAyOGI4ODE1MWQyZTgxMDAxNTFkMmZkYzEyNDAwMDAiLCJuZXh0b2ZraW5uYW1lIjoiVmlzaGFsIE1hbmUiLCJiYW5raWZzY2NvZGUiOiIiLCJuZXh0b2ZraW5hZGRyZXNzIjpudWxsLCJuZXh0b2ZraW5lbWFpbCI6bnVsbCwibmV4dG9ma2lucGhvbmUiOiI4MzkwMDIxMjY3IiwibmV4dG9ma2lucmVsYXRpb253aXRoZW1wbG95ZWUiOiJCcm90aGVyICIsImVtcHByb2ZpbGVtZG9jaWQiOiI2MzI5NDlmYTA3ZDkyNjZjMmI2MWYxZDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiYWRoYXJjYXJkbWRvY2lkIjoiNjMyNTlmYTFmZjg3ODBmZTc5ZTZjMWQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIsInBhbmNhcmRtZG9jaWQiOiI2MzI1OWZiZmZmODc4MGZlNzllNmMxZDkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiZW1wbG95ZWV1c2VybmFtZSI6InJvaGluaSAgICAgICAgICAgICAgIn1dLCJpYXQiOjE2ODc0MTAzMjh9.T-Icre_mbMDHwEj_lTCCK1wP2K38Vg_c6wWy1TedJZ4"
      //   },
      //   body: jsonEncode(<String, dynamic>{
      //     'accountId': accountId,
      //     'accountScheduleId': accountScheduleId,
      //   }),
      // );
      // if (response.statusCode == 200) {
      //   debugPrint('${response.body}..............');
      //   // ignore: use_build_context_synchronously
      //   showSuccessAlert(
      //     context,
      //     Expanded(
      //       child: Text(
      //         '$accountName\naccount created successfully !',
      //       ),
      //     ),
      //   );
      // } else {
      //   debugPrint(response.statusCode.toString());
      //   debugPrint("respond...body check......//");
      //   // ignore: use_build_context_synchronously
      //   showErrorAlert(
      //     context,
      //     const Text(
      //       'Something went wrong !',
      //     ),
      //   );
      // }
    } catch (e) {
      debugPrint(e.toString());
      // ignore: use_build_context_synchronously
      showErrorAlert(
        context,
        Text(
          e.toString(),
        ),
      );
    }
  }
}

showErrorAlert(BuildContext context, Widget errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Container(
        padding: const EdgeInsets.all(13),
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFFC72C41),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: errorMessage,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

// Alert DailogBox for success
showSuccessAlert(BuildContext context, Widget successMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Container(
        padding: const EdgeInsets.all(15),
        height: 80,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 73, 135, 64),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: successMessage,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
