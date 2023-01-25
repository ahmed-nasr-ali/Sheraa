import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';

import 'package:sheraa/ui/new%20Home/domine/use%20case/get_specific_ad_use_case.dart';

class GetSpecificAdProvider extends ChangeNotifier {
  GetSpecificAdUseCase getSpecificAdUseCase;

  GetSpecificAdProvider({
    required this.getSpecificAdUseCase,
  });

  Future<AdEntity> getSpecificAdData(BuildContext context, String adId) async {
    _adDetails = await getSpecificAdUseCase.call(context, adId);

    return _adDetails;
  }

  AdEntity _adDetails = AdEntity();

  AdEntity get adDetails => _adDetails;

  setDataToAdDetails(AdEntity adEntity) {
    _adDetails = adEntity;
    print(_adDetails.name);
    notifyListeners();
  }
}
