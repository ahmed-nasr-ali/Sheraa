import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/report_ad_provider.dart';

class ReportAdController {
  static Future<bool> reportAdMethod(
      BuildContext context, Map<String, dynamic> body) async {
    final _reportAdProvider =
        Provider.of<ReportAdProvider>(context, listen: false);

    bool methodResult = await _reportAdProvider.reportAdMethod(context, body);

    if (methodResult) {
      snakBarWidget(
        context: context,
        content: AppLocalizations.of(context)!
            .translate("Your report will be reviewed by the administration"),
      );
      return true;
    } else
      return false;
  }
}
