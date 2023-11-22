import 'package:flutter/material.dart';
import 'package:flutter_practice/provider_for_adv_account/adv_acc_provider.dart';
import 'package:provider/provider.dart';

class AdvAccount extends StatefulWidget {
  const AdvAccount({super.key});

  @override
  State<AdvAccount> createState() => _AdvAccountState();
}

class _AdvAccountState extends State<AdvAccount> {
  var checkBox1 = false;
  String accountScheduleId = '402881eb553953350155395adf1f0004';
  String accountId = '';
  String accountName = '';

  var doubleWidth, doubleHeight, size;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdvAccProvider>(context, listen: false)
          .fetchAllAccountData(context, accountScheduleId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<AdvAccProvider>(
          builder: (context, value, child) {
            final list = value.accountList;
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final accList = list[index];
                  return ListTile(
                    title: Text(
                      accList.name.toString(),
                      style: const TextStyle(fontSize: 11),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        accountId = accList.id.toString();
                        accountName = accList.name.toString();
                        value.postDataIntoAdvAcc(
                            accountId, accountScheduleId, accountName, context);
                        // value.removeItemAtIndex(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
