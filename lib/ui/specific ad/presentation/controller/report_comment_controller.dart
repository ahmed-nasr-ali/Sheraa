import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';

import '../providers/report_comment_provider.dart';

class ReportCommentController {
  static Future reportCommentMethod(
      BuildContext context, Map<String, dynamic> body) async {
    final _reportcommentprovider =
        Provider.of<ReportCommentsProvider>(context, listen: false);

    bool methodResult =
        await _reportcommentprovider.reportCommentMethod(context, body);

    if (methodResult) {
      Navigator.pop(context);
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
