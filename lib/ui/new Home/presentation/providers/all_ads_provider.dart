import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';

import 'package:sheraa/ui/new%20Home/domine/use%20case/get_allads_use_case.dart';

class AdOnHomeScreenProvider extends ChangeNotifier {
  GetAllAdsUseCase getAllAdsUseCase;

  AdOnHomeScreenProvider({
    required this.getAllAdsUseCase,
  });

  Future<List<AdEntity>> getAllAdsList(BuildContext context) async {
    return await getAllAdsUseCase.call(context);
  }

  List<AdEntity> _adList = [];

  List<AdEntity> get adList => _adList;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  setDataToAdListList(List<AdEntity> adList) {
    _adList.addAll(adList);

    print("ad list length is : ${_adList.length}");
    notifyListeners();
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    print("isLoading is : $_isLoading");
    notifyListeners();
  }

  setAllDataToDefault() {
    _adList.clear();
    _isLoading = true;
  }
}
