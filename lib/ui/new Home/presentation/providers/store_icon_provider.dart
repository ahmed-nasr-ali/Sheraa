import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/store_icon_entity.dart';

import 'package:sheraa/ui/new%20Home/domine/use%20case/get_store_icons_use_case.dart';

class StoreIconProvider extends ChangeNotifier {
  StoreIconsUseCase storeIconsUseCase;

  StoreIconProvider({
    required this.storeIconsUseCase,
  });

  Future<List<StoreIConEntity>> getStoreIconList(BuildContext context) async {
    return await storeIconsUseCase.call(context);
  }

  List<StoreIConEntity> _storeIconsList = [];

  List<StoreIConEntity> get stroeIconList => _storeIconsList;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  setDataToStoreIconList(List<StoreIConEntity> storeIconList) {
    _storeIconsList.addAll(storeIconList);

    print("store Icon length is : ${_storeIconsList.length}");
    notifyListeners();
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    print("isLoading is : $_isLoading");
    notifyListeners();
  }

  setAllDataToDefault() {
    _storeIconsList.clear();
    _isLoading = true;
  }
}
