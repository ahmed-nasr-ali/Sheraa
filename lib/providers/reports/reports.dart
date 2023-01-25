// ignore_for_file: unused_field, unused_local_variable, unnecessary_statements

import 'package:flutter/cupertino.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class ReportCommentProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  Future<void> reportCommentMethod(BuildContext context, Map body,
      {int back = 1}) async {
    final response = await _apiProvider.post(
      "${Urls.COMMENTS_URL}/report",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );

    if (response["status_code"] == 200) {
      Navigator.pop(context);

      back == 1 ? null : Navigator.pop(context);

      snakBarWidget(
        context: context,
        content: AppLocalizations.of(context)!
            .translate("Your report will be reviewed by the administration"),
      );
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    notifyListeners();
  }
}

// class ReportAdProvider extends ChangeNotifier {
//   ApiProvider _apiProvider = ApiProvider();

//   Future<void> reporteAdMethod(BuildContext context, Map body,
//       {int back = 1}) async {
//     final response = await _apiProvider.post(
//       "${Urls.REPORT_AD_URL}",
//       header: {
//         'Accept': 'application/json',
//         "Accept-Language": UserData.getUSerLang(),
//         'Content-Type': 'application/json',
//         "Authorization": "Bearer ${UserData.getUserApiToken()}"
//       },
//       body: body,
//     );

//     if (response["status_code"] == 201) {
//       Navigator.pop(context);

//       back == 1 ? null : Navigator.pop(context);

//       snakBarWidget(
//         context: context,
//         content: AppLocalizations.of(context)!
//             .translate("Your report will be reviewed by the administration"),
//       );
//     } else if (response["status_code"] == 401) {
//       Auth401Error(context);
//     } else {
//       Commons.showError(
//           context: context, message: response['response']["message"]);
//     }

//     notifyListeners();
//   }
// }
