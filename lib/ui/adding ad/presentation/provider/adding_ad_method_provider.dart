import 'package:flutter/cupertino.dart';

import 'package:sheraa/ui/adding%20ad/domin/use%20cases/adding_ad_use_case.dart';

class AddingAdMethodProvider extends ChangeNotifier {
  AddingAdUseCase addingAdUseCase;

  AddingAdMethodProvider({
    required this.addingAdUseCase,
  });

  Future<bool> addingAdMethod(
      BuildContext context, Map<String, dynamic> body) async {
    return await addingAdUseCase.call(context, body);
  }
}
