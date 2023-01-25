import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/adding_tofavorite_provider.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/deleting_from_provider.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/favorite_ad_provider.dart';

class FavoriteAdCOntroller {
  static Future checkIfAdIsFavorteOrNot(BuildContext context, int adId) async {
    final _favoriteAdProvider =
        Provider.of<FavoriteAdProvider>(context, listen: false);
    print("ad id is : $adId");
    if (_favoriteAdProvider.addingAdToFavoriteAdList.contains(adId)) {
      _favoriteAdProvider.setIsFavorite(true);
    } else if (_favoriteAdProvider.deleteingAdfromFavoriteAdList
        .contains(adId)) {
      _favoriteAdProvider.setIsFavorite(false);
    }
  }

  static Future addingAdToFavoriteAdListMethod(
      BuildContext context, Map<String, dynamic> body, int adId) async {
    final _addingToFavoriteProvider =
        Provider.of<AddingAdToFavoriteAdListProvider>(context, listen: false);

    bool methodResult =
        await _addingToFavoriteProvider.addingAdToFavoriteAdList(context, body);

    if (methodResult) {
      final _favoriteAdProvider =
          Provider.of<FavoriteAdProvider>(context, listen: false);

      _favoriteAdProvider.methodAddingAdToFavoriteAddList(adId);

      Provider.of<FavoriteAdProvider>(context, listen: false)
          .setIsFavorite(true);
    }
  }

  static Future deletingAdFromFavoriteAdsMethod(
      BuildContext context, Map<String, dynamic> body, int adId) async {
    final _deletingAdFromFavoriteProvider =
        Provider.of<DeletingAdFromFavoriteAdListProvider>(context,
            listen: false);

    bool methodResult = await _deletingAdFromFavoriteProvider
        .deletingAdFromFavoriteAdList(context, body);

    if (methodResult) {
      final _favoriteAdProvider =
          Provider.of<FavoriteAdProvider>(context, listen: false);

      _favoriteAdProvider.methodDeletingAdFromFavoriteAddList(adId);

      Navigator.pop(context);

      Provider.of<FavoriteAdProvider>(context, listen: false)
          .setIsFavorite(false);
    }
  }
}
