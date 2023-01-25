import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/tell_me_when_price_decrease_provider.dart';

class TellMeWhenPriceDecreaseController {
  static Future<bool> tellMeMethod(
      BuildContext context, Map<String, dynamic> body) async {
    final tellMeProvider =
        Provider.of<TellMeWhenPriceDecreaseProvider>(context, listen: false);

    bool methodResult = await tellMeProvider.tellMeMethod(context, body);

    if (methodResult) {
      return true;
    } else
      return false;
  }
}
