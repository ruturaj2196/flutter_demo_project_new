import 'package:flutter/material.dart';
import 'package:flutter_practice/provider_for_adv_account/adv_acc_api_services.dart';
import 'package:flutter_practice/provider_for_adv_account/adv_acc_class.dart';

class AdvAccProvider extends ChangeNotifier {
  bool isLoading = false;
  final ApiServices _services = ApiServices();
  List<ShadowAccountClass> _accountList = [];
  List<ShadowAccountClass> get accountList => _accountList;

  void removeItemAtIndex(int index) {
    if (index >= 0 && index < accountList.length) {
      _accountList.removeAt(index);
      notifyListeners();
    }
  }

  Future<void> fetchAllAccountData(
      BuildContext ctx, String accountScheduleId) async {
    isLoading = true;
    notifyListeners();
    final response =
        await _services.fetchShadowAccountList(ctx, accountScheduleId);
    _accountList = response;

    isLoading = false;
    notifyListeners();
  }

  Future<void> postDataIntoAdvAcc(String accountId, String accountScheduleId,
      String accountName, BuildContext context) async {
    debugPrint('$accountId, $accountName, $accountScheduleId...........111');
    final post = await _services.postIntoAdvAccData(
        accountId, accountScheduleId, accountName, context);
    _accountList = post;
    notifyListeners();
  }
}
