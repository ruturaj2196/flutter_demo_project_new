import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/stateManagement/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<Subscribers>> getAll() async {
    try {
      const url = "https://192.168.1.38:8081/message/subscriber/subscriberdd";
      final uri = Uri.parse(url);
      final response = await http.get(headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOlt7ImlkIjoiOWE4NGM5NWVlOWM3NDkwY2FiZjVhZDU0ZmU4ZjA2MjMiLCJjb2RlIjoiMDQtMDEtMDAwMDAyICAgIiwiZW1wbG95ZWV0eXBlX2lkIjoiNDAyODliODE1YjM3NWEyYjAxNWIzNzY0MDNjODAwMDEiLCJlbXBsb3llZWRlcGFydG1lbnRfaWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3NjZhNTgyMDAwOCIsImVtcGxveWVlZGVzaWduYXRpb25faWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3Njg0Njg0MDAwZiIsImJpcnRoZGF0ZSI6IjE5OTMtMTAtMThUMTg6MzA6MDAuMDAwWiIsImhvbm9yaWZpYyI6Ik1pc3MgICAgICAiLCJsYXN0bmFtZSI6Ik1BTkUiLCJmaXJzdG5hbWUiOiJST0hJTkkiLCJtaWRkbGVuYW1lIjoiUFJBS0FTSCAiLCJjdXJyZW50YWRkcmVzczEiOiJTYW5nYXdhZGUgIiwiY3VycmVudGFkZHJlc3MyIjoiU2FuZ2F3YWRlIiwiY3VycmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsImN1cnJlbnRwaW4iOjQxNjIwMiwiY3VycmVudHN0YXRlIjoiTWFoYXJhc2h0cmEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLCJwZXJtYW5lbnRhZGRyZXNzMSI6IlNhbmdhd2FkZSAiLCJwZXJtYW5lbnRhZGRyZXNzMiI6IlNhbmdhd2FkZSIsInBlcm1hbmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsInBlcm1hbmVudHBpbiI6NDE2MjAyLCJwZXJtYW5lbnRzdGF0ZSI6Ik1haGFyYXNodHJhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwicXVhbGlmaWNhdGlvbiI6IkJFICggIENTRSkiLCJkYXRlb2Zqb2luaW5nIjoiMjAyMi0wMi0wOVQxODozMDowMC4wMDBaIiwiZGF0ZW9mbGVhdmluZyI6bnVsbCwiZXBmbnVtYmVyIjoiIiwiZnBmbnVtYmVyIjoiIiwicGFubnVtYmVyIjoiRFBFUE05ODQ5SyIsImFhZGhhcm51bWJlciI6IjY1OTk4MTQxODE5MyIsImJhbmthY2NvdW50bnVtYmVyIjoiMCIsImJhbmtuYW1lIjoiSURCSSIsImVtYWlsIjoicm9oaW5pbWFuZTI5NUBnbWFpbC5jb20iLCJwaG9uZW51bWJlciI6IiIsIm1vYmlsZSI6Ijg3ODg4NDgzMDQiLCJjb21wYW55X2lkIjoiNDAyOGI4ODE1MWQyZTgxMDAxNTFkMmZkYzEyNDAwMDAiLCJuZXh0b2ZraW5uYW1lIjoiVmlzaGFsIE1hbmUiLCJiYW5raWZzY2NvZGUiOiIiLCJuZXh0b2ZraW5hZGRyZXNzIjpudWxsLCJuZXh0b2ZraW5lbWFpbCI6bnVsbCwibmV4dG9ma2lucGhvbmUiOiI4MzkwMDIxMjY3IiwibmV4dG9ma2lucmVsYXRpb253aXRoZW1wbG95ZWUiOiJCcm90aGVyICIsImVtcHByb2ZpbGVtZG9jaWQiOiI2MzI5NDlmYTA3ZDkyNjZjMmI2MWYxZDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiYWRoYXJjYXJkbWRvY2lkIjoiNjMyNTlmYTFmZjg3ODBmZTc5ZTZjMWQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIsInBhbmNhcmRtZG9jaWQiOiI2MzI1OWZiZmZmODc4MGZlNzllNmMxZDkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiZW1wbG95ZWV1c2VybmFtZSI6InJvaGluaSAgICAgICAgICAgICAgIn1dLCJpYXQiOjE2ODc0MTAzMjh9.T-Icre_mbMDHwEj_lTCCK1wP2K38Vg_c6wWy1TedJZ4"
      }, uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final todos = json.map((e) {
          return Subscribers(
            id: e['id'],
            emailaddress: e['emailaddress'],
          );
        }).toList();
        return todos;
      } else {
        throw 'something gets wrong';
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future postIntoSubscriberTableData(
    BuildContext context,
    int subscriberId,
    String emailAddress,
    int mobileNumber,
  ) async {
    try {
      var url = Uri.parse(
        "https://192.168.1.38:8081/message/subscriber/add-subscriber",
      );
      debugPrint(
          "$subscriberId,$emailAddress,$mobileNumber, .........................this the data.");
      final response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOlt7ImlkIjoiOWE4NGM5NWVlOWM3NDkwY2FiZjVhZDU0ZmU4ZjA2MjMiLCJjb2RlIjoiMDQtMDEtMDAwMDAyICAgIiwiZW1wbG95ZWV0eXBlX2lkIjoiNDAyODliODE1YjM3NWEyYjAxNWIzNzY0MDNjODAwMDEiLCJlbXBsb3llZWRlcGFydG1lbnRfaWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3NjZhNTgyMDAwOCIsImVtcGxveWVlZGVzaWduYXRpb25faWQiOiI0MDI4OWI4MTViMzc1YTJiMDE1YjM3Njg0Njg0MDAwZiIsImJpcnRoZGF0ZSI6IjE5OTMtMTAtMThUMTg6MzA6MDAuMDAwWiIsImhvbm9yaWZpYyI6Ik1pc3MgICAgICAiLCJsYXN0bmFtZSI6Ik1BTkUiLCJmaXJzdG5hbWUiOiJST0hJTkkiLCJtaWRkbGVuYW1lIjoiUFJBS0FTSCAiLCJjdXJyZW50YWRkcmVzczEiOiJTYW5nYXdhZGUgIiwiY3VycmVudGFkZHJlc3MyIjoiU2FuZ2F3YWRlIiwiY3VycmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsImN1cnJlbnRwaW4iOjQxNjIwMiwiY3VycmVudHN0YXRlIjoiTWFoYXJhc2h0cmEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLCJwZXJtYW5lbnRhZGRyZXNzMSI6IlNhbmdhd2FkZSAiLCJwZXJtYW5lbnRhZGRyZXNzMiI6IlNhbmdhd2FkZSIsInBlcm1hbmVudGNpdHlfaWQiOiJmY2MxMGY4NWJhODg0ZTkyYjFmNmExNGUzMWY0NjQxMiIsInBlcm1hbmVudHBpbiI6NDE2MjAyLCJwZXJtYW5lbnRzdGF0ZSI6Ik1haGFyYXNodHJhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwicXVhbGlmaWNhdGlvbiI6IkJFICggIENTRSkiLCJkYXRlb2Zqb2luaW5nIjoiMjAyMi0wMi0wOVQxODozMDowMC4wMDBaIiwiZGF0ZW9mbGVhdmluZyI6bnVsbCwiZXBmbnVtYmVyIjoiIiwiZnBmbnVtYmVyIjoiIiwicGFubnVtYmVyIjoiRFBFUE05ODQ5SyIsImFhZGhhcm51bWJlciI6IjY1OTk4MTQxODE5MyIsImJhbmthY2NvdW50bnVtYmVyIjoiMCIsImJhbmtuYW1lIjoiSURCSSIsImVtYWlsIjoicm9oaW5pbWFuZTI5NUBnbWFpbC5jb20iLCJwaG9uZW51bWJlciI6IiIsIm1vYmlsZSI6Ijg3ODg4NDgzMDQiLCJjb21wYW55X2lkIjoiNDAyOGI4ODE1MWQyZTgxMDAxNTFkMmZkYzEyNDAwMDAiLCJuZXh0b2ZraW5uYW1lIjoiVmlzaGFsIE1hbmUiLCJiYW5raWZzY2NvZGUiOiIiLCJuZXh0b2ZraW5hZGRyZXNzIjpudWxsLCJuZXh0b2ZraW5lbWFpbCI6bnVsbCwibmV4dG9ma2lucGhvbmUiOiI4MzkwMDIxMjY3IiwibmV4dG9ma2lucmVsYXRpb253aXRoZW1wbG95ZWUiOiJCcm90aGVyICIsImVtcHByb2ZpbGVtZG9jaWQiOiI2MzI5NDlmYTA3ZDkyNjZjMmI2MWYxZDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiYWRoYXJjYXJkbWRvY2lkIjoiNjMyNTlmYTFmZjg3ODBmZTc5ZTZjMWQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIsInBhbmNhcmRtZG9jaWQiOiI2MzI1OWZiZmZmODc4MGZlNzllNmMxZDkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiwiZW1wbG95ZWV1c2VybmFtZSI6InJvaGluaSAgICAgICAgICAgICAgIn1dLCJpYXQiOjE2ODc0MTAzMjh9.T-Icre_mbMDHwEj_lTCCK1wP2K38Vg_c6wWy1TedJZ4"
        },
        body: jsonEncode(<String, dynamic>{
          'subscriberId': subscriberId,
          'emailAddress': emailAddress,
          'mobileNumber': mobileNumber,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint('${response.body}..............');
        getAll();
        // ignore: use_build_context_synchronously
      } else {
        debugPrint(response.statusCode.toString());
        debugPrint("respond...body check......//");
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
