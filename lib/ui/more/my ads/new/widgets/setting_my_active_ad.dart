// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/delete%20ad%20bottomsheet/delete_ad_screen.dart';
import 'package:sheraa/ui/more/my%20ads/edit%20ad/page/edit_ad_screen.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

class SettingMyActiveAds extends StatelessWidget {
  AdEntity adDetails;
  final Function onTap;

  SettingMyActiveAds({
    Key? key,
    required this.adDetails,
    required this.onTap,
  }) : super(key: key);

  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 58,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width! / 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditAdScreen(
                                adDetails: adDetails,
                              )));
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/magicpen.png"),
                    SmallText(
                      size: _height! / 81.2, //10
                      color: textGrayColor,
                      text: AppLocalizations.of(context)!.translate("edit"),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: DeleteAdScreen(
                          adId: adDetails.id ?? 0,
                          onPressedFunction: onTap,
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/close-circle.png"),
                    SmallText(
                      size: _height! / 81.2, //10
                      color: textGrayColor,
                      text: AppLocalizations.of(context)!.translate("Remove"),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Image.asset("assets/images/chart.png"),
                    SmallText(
                      size: _height! / 81.2, //10
                      color: textGrayColor,
                      text:
                          AppLocalizations.of(context)!.translate("statistics"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height! / 116,
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height! / 58,
        ),
      ],
    );
  }
}
