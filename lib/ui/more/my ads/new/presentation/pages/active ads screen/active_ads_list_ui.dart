// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/more/my%20ads/new/widgets/ad_shape_depend_on_page.dart';
import 'package:sheraa/ui/more/my%20ads/new/widgets/ad_status_and_ads_views.dart';
import 'package:sheraa/ui/more/my%20ads/new/widgets/setting_my_active_ad.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/specific%20ad%20screen/specific_ad_screen.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/get_all_comments_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class MyActiveAdsListUi extends StatelessWidget {
  AdEntity myActiveAdDetails;
  final Function onTap;
  MyActiveAdsListUi({
    Key? key,
    required this.myActiveAdDetails,
    required this.onTap,
  }) : super(key: key);

  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Provider.of<GetAllCommentsProvider>(context, listen: false)
                .setAllDateToDefault();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SpecificAdScreenDetails(
                          pageName: "moreInformation",
                          isMyAd: true,
                          adDetails: myActiveAdDetails,
                        )));
          },
          child: AdShapeDepenonPage(
            isFavorteAd: false,
            isHeartWidgetAppear: false,
            isEffectiveAd: true,
            adDetails: myActiveAdDetails,
          ),
        ),
        SettingMyActiveAds(
          adDetails: myActiveAdDetails,
          onTap: onTap,
        ),
        AdStatusAndAdViews(
          ad_Id: myActiveAdDetails.id ?? 0,
          adView: myActiveAdDetails.views ?? 0,
          statusNumber: myActiveAdDetails.endedIn,
        ),
        SizedBox(
          height: _height! / 40.6, //20
        ),
        CustomButton(
          enableVerticalMargin: false,
          enableHorizontalMargin: true,
          horizontalMargin: _width! / 12.5, //30
          width: _width,
          height: _height! / 18.04444444444444, //35
          btnLbl:
              AppLocalizations.of(context)!.translate("Add more information"),
          onPressedFunction: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SpecificAdScreen(
            //       pageName: "moreInformation", //moreInformation (second case)
            //       isMyAd: true,
            //       adDetails: myActiveAdDetails,
            //     ),
            //   ),
            // );
          },
          btnColor: whiteColor,
          btnStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainAppColor,
              fontSize: _height! / 67.66666666666667),
          borderColor: mainAppColor,
        ),
        SizedBox(
          height: _height! / 32.48,
        ),
      ],
    );
  }
}
