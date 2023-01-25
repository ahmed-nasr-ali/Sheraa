import 'package:flutter/cupertino.dart';

import 'package:sheraa/ui/more/favorite%20ads/domine/use%20cases/get_all_favorite_ads_use_case.dart';

class FavoriteAdProvider extends ChangeNotifier {
  GetAllFavoriteAdUseCase getAllFavoriteAdUseCase;

  FavoriteAdProvider({
    required this.getAllFavoriteAdUseCase,
  });

  bool _isFavoriteAd = false;

  bool get isFavoriteAd => _isFavoriteAd;

  setIsFavorite(bool isFavorite) {
    _isFavoriteAd = isFavorite;
    print("is favorite is  : $_isFavoriteAd");
  }

  List _addingAdToFavoriteAdList = [];
  List _deletingAdFromFavoriteAdList = [];

  methodAddingAdToFavoriteAddList(int adId) {
    if (_deletingAdFromFavoriteAdList.contains(adId)) {
      _deletingAdFromFavoriteAdList.removeWhere((item) => item == adId);
    }

    _addingAdToFavoriteAdList.contains(adId)
        ? _addingAdToFavoriteAdList.removeWhere((item) => item == adId)
        : _addingAdToFavoriteAdList.add(adId);

    print("favorite ad is :  $_addingAdToFavoriteAdList");

    print("delete ad from favorite List is :  $_deletingAdFromFavoriteAdList");
  }

  List get addingAdToFavoriteAdList => _addingAdToFavoriteAdList;

  ///========================================================================

  methodDeletingAdFromFavoriteAddList(int adId) {
    if (_addingAdToFavoriteAdList.contains(adId)) {
      _addingAdToFavoriteAdList.removeWhere((item) => item == adId);
    }

    _deletingAdFromFavoriteAdList.contains(adId)
        ? _deletingAdFromFavoriteAdList.removeWhere((item) => item == adId)
        : _deletingAdFromFavoriteAdList.add(adId);

    print("delete ad from favorite List is :  $_deletingAdFromFavoriteAdList");

    print("favorite ad is :  $_addingAdToFavoriteAdList");
  }

  List get deleteingAdfromFavoriteAdList => _deletingAdFromFavoriteAdList;
}
