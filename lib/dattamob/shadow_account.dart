import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ShadowAccount extends StatefulWidget {
  const ShadowAccount({super.key});

  @override
  State<ShadowAccount> createState() => _ShadowAccountState();
}

class _ShadowAccountState extends State<ShadowAccount> {
  String accountId = '';
  String accountName = '';
  var checkBox1 = false;
  @override
  void initState() {
    try {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<DataProvider>(context, listen: false).getAllData();
      });
    } catch (e) {
      errormsg();
    }

    super.initState();
  }

  void errormsg() => showDialog(
      context: context,
      builder: (ctx) => const AlertDialog(
            title: Text('Data not found'),
            content: Icon(
              Icons.error,
              size: 30,
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shadow account '),
      ),
      body: Consumer<DataProvider>(builder: (ctx, value, child) {
        final datalist = value.datalist;
        return ListView.builder(
            itemCount: datalist.length,
            itemBuilder: (ctx, index) {
              final shadowAc = datalist[index];
              return ListTile(
                title: Row(
                  children: [
                    Text(shadowAc.name),
                    FormField(
                      builder: (state) {
                        return Checkbox(
                          splashRadius: 10.0,
                          value: checkBox1,
                          onChanged: (value) {
                            checkBox1 = value!;
                            state.didChange(value);
                            if (checkBox1 == true) {
                              accountName = shadowAc.name;
                              accountId = shadowAc.id.toString();
                              debugPrint('accountId = $accountId');
                              debugPrint('accountName = $accountName');
                            } else {
                              debugPrint('please select account name..');
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }

  Future<List<ShadowAccounts>> fetchShadowAccountList() async {
    var url =
        'http://192.168.1.38:8081/account/advaccountdata/account-data?accountScheduleId=402881eb553953350155395adf1f0004';

    debugPrint('.....%%%.......$url');
    final response = await http.get(
      // headers: {"Authorization": ApiUrl.token},
      Uri.parse(url),
    );
    // response.body is String
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List; //converted to dynamic list
      final accountList = data.map(
        (e) {
          return ShadowAccounts(
            id: e['id'],
            name: e['name'],
          );
        },
      ).toList();
      return accountList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class ShadowAccounts {
  String id;
  String name;

  ShadowAccounts({
    required this.id,
    required this.name,
  });

  factory ShadowAccounts.fromJson(Map<String, dynamic> json) => ShadowAccounts(
        id: json["id"],
        name: json["name"],
      );
}

// to api call

class DataProvider extends ChangeNotifier {
  _ShadowAccountState _service = _ShadowAccountState();
  bool isloading = false;
  List<ShadowAccounts> _datalist = [];
  List<ShadowAccounts> get datalist => _datalist;

  Future<void> getAllData() async {
    isloading = true;
    notifyListeners();

    final response = await _service.fetchShadowAccountList();

    _datalist = response;
    isloading = false;
    notifyListeners();
  }
}
