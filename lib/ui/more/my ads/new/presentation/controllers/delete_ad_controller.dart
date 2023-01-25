import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/active_ads_provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/deleting_ad_provider.dart';

class DeleteAdController {
  static onTaponDeleteAd(BuildContext context, int adId) {
    Navigator.pop(context);
    Provider.of<DeletingAdProvider>(context, listen: false)
        .addAdIdToDeletingAdList(adId);
  }

  static Future<bool> deleteAdMethod(
      BuildContext context, int adId, int index) async {
    bool x;

    final deleteAdProvider =
        Provider.of<DeletingAdProvider>(context, listen: false);
    x = await deleteAdProvider.deleteAdMethod(context, adId);

    deleteAdProvider.clearDeletingAdList();

    if (x) {
      Provider.of<MyActiveAdsProvider>(context, listen: false)
          .myActiveAdsList
          .removeAt(index);

      snakBarWidget(context: context, content: "remove ad succufly");
    } else {
      snakBarWidget(
          context: context, content: "Can not delete ad there is a problem");
    }

    return x;
  }
}
