import 'package:flutter/cupertino.dart';

import 'package:sheraa/ui/specific%20ad/domine/use%20cases/tellme_when_price_decrease_use_case.dart';

class TellMeWhenPriceDecreaseProvider extends ChangeNotifier {
  TellMeWhenPriceDecreaseUseCase tellMeWhenPriceDecreaseUseCase;

  TellMeWhenPriceDecreaseProvider({
    required this.tellMeWhenPriceDecreaseUseCase,
  });

  Future<bool> tellMeMethod(
      BuildContext context, Map<String, dynamic> body) async {
    return await tellMeWhenPriceDecreaseUseCase.call(context, body);
  }
}
