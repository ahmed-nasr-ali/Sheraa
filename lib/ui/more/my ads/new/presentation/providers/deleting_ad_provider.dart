import 'package:flutter/cupertino.dart';

import 'package:sheraa/ui/more/my%20ads/new/domin/use%20case/delete_ad_use_case.dart';

class DeletingAdProvider extends ChangeNotifier {
  DeleteMyAdUseCase deleteMyAdUseCase;

  DeletingAdProvider({
    required this.deleteMyAdUseCase,
  });

  Future<bool> deleteAdMethod(BuildContext context, int adId) async {
    return await deleteMyAdUseCase.call(context, adId);
  }

  List _deletingAdList = [];

  List get deletingAdList => _deletingAdList;

  addAdIdToDeletingAdList(int adId) {
    _deletingAdList.add(adId);
    print("deleting ad lis is : $_deletingAdList");
  }

  clearDeletingAdList() {
    _deletingAdList.clear();
    print("deleting ad lis is : $_deletingAdList");
    notifyListeners();
  }
}
