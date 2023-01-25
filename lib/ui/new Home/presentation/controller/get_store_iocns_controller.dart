import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/store_icon_entity.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/store_icon_provider.dart';

class StoreIconController {
  static getStoreIconImageList(BuildContext context) async {
    final _storeIconProvider =
        Provider.of<StoreIconProvider>(context, listen: false);

    if (_storeIconProvider.stroeIconList.isEmpty) {
      List<StoreIConEntity> storeIconList =
          await _storeIconProvider.getStoreIconList(context);

      _storeIconProvider.setDataToStoreIconList(storeIconList);
      _storeIconProvider.setLoading(false);
    }
  }
}
