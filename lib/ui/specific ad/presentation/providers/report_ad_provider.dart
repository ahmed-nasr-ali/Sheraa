import 'package:flutter/cupertino.dart';

import 'package:sheraa/ui/specific%20ad/domine/use%20cases/report_ad_use_case.dart';

class ReportAdProvider extends ChangeNotifier {
  ReportAdUseCase reportAdUseCase;

  ReportAdProvider({
    required this.reportAdUseCase,
  });

  Future<bool> reportAdMethod(
      BuildContext context, Map<String, dynamic> body) async {
    return await reportAdUseCase.call(context, body);
  }
}
