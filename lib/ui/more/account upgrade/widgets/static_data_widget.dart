import 'package:flutter/material.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/account%20upgrade/widgets/account_features.dart';
import 'package:sheraa/utils/app_colors.dart';

class StaticDataAccountUpgrade extends StatelessWidget {
  const StaticDataAccountUpgrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountFeatures(
          isTrailImage: true,
          rightText: AppLocalizations.of(context)!.translate("ad_pormotion"),
          bottomRightText: AppLocalizations.of(context)!.translate(
              "Possibility to place a promoted advertisement among the list of advertisements (validity of the subscription period)"),
          imageUrl: "assets/images/checkboxcirclefill.png",
          leftText: "",
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        AccountFeatures(
          isTrailImage: true,
          rightText: AppLocalizations.of(context)!
              .translate("Cancel and delete replies"),
          bottomRightText: AppLocalizations.of(context)!.translate(
            "It is possible to disable and delete the responses feature in advertisements",
          ),
          imageUrl: "assets/images/checkboxcirclefill.png",
          leftText: "",
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        AccountFeatures(
          isTrailImage: true,
          rightText: AppLocalizations.of(context)!.translate("Quality Badge"),
          bottomRightText: AppLocalizations.of(context)!.translate(
            "Get the Quality Badge on your account",
          ),
          imageUrl: "assets/images/checkboxcirclefill.png",
          leftText: "",
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        AccountFeatures(
          isTrailImage: true,
          rightText: AppLocalizations.of(context)!
              .translate("Find out who viewed your ad"),
          bottomRightText: AppLocalizations.of(context)!.translate(
            "It is possible to know who viewed your ad and who contacted you and contacted you or emailed you",
          ),
          imageUrl: "assets/images/checkboxcirclefill.png",
          leftText: "",
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        AccountFeatures(
          isTrailImage: true,
          rightText: AppLocalizations.of(context)!.translate("Ad stats"),
          bottomRightText: AppLocalizations.of(context)!.translate(
            "Dashboard with all ad stats added",
          ),
          imageUrl: "assets/images/checkboxcirclefill.png",
          leftText: "",
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        AccountFeatures(
          isTrailImage: true,
          rightText: AppLocalizations.of(context)!.translate("ad_requests"),
          bottomRightText: AppLocalizations.of(context)!.translate(
            "Benefit from the service of requesting advertisements in an unlimited number",
          ),
          imageUrl: "assets/images/checkboxcirclefill.png",
          leftText: "",
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        AccountFeatures(
          isTrailImage: true,
          rightText: AppLocalizations.of(context)!
              .translate("Add more than one phone number in ads"),
          bottomRightText: AppLocalizations.of(context)!.translate(
            "It is possible to add more than one phone number in one ad",
          ),
          imageUrl: "assets/images/checkboxcirclefill.png",
          leftText: "",
        ),
      ],
    );
  }
}
