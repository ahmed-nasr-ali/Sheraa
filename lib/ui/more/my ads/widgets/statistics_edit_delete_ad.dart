// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/ui/more/my%20ads/delete%20ad%20bottomsheet/delete_ad_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

import '../edit ad/page/edit_ad_screen.dart';

class StatisticsEditAndDeleteAd extends StatefulWidget {
  Ad adDetails;
  bool isEffectiveAd;

  StatisticsEditAndDeleteAd({
    Key? key,
    required this.adDetails,
    required this.isEffectiveAd,
  }) : super(key: key);

  @override
  State<StatisticsEditAndDeleteAd> createState() =>
      _StatisticsEditAndDeleteAdState();
}

class _StatisticsEditAndDeleteAdState extends State<StatisticsEditAndDeleteAd> {
  double? _height;
  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return widget.isEffectiveAd
        ? buildAdStatisticsAndDeleteAndEdit(_height!, _width!)
        : buildAdStatisticsAndDelete(_height!, _width!);
  }

  Widget buildAdStatisticsAndDeleteAndEdit(double _height, double _width) {
    return Column(
      children: [
        SizedBox(
          height: _height / 58,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width / 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => EditAdScreen(
                  //               adDetails: widget.adDetails,
                  //             )));
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/magicpen.png"),
                    SmallText(
                      size: _height / 81.2, //10
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
                            adId: widget.adDetails.id ?? 0,
                            onPressedFunction: () {},
                          ),
                        );
                      });
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/close-circle.png"),
                    SmallText(
                      size: _height / 81.2, //10
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
                      size: _height / 81.2, //10
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
          height: _height / 116,
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height / 58,
        ),
      ],
    );
  }

  Widget buildAdStatisticsAndDelete(double _height, double _width) {
    return Column(
      children: [
        SizedBox(
          height: _height / 32.48,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width / 3.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                            onPressedFunction: () {},
                            adId: widget.adDetails.id ?? 0,
                          ),
                        );
                      });
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/close-circle.png"),
                    SmallText(
                      size: _height / 81.2, //10
                      color: textGrayColor,
                      text: AppLocalizations.of(context)!.translate("Remove"),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset("assets/images/chart.png"),
                  SmallText(
                    size: _height / 81.2, //10
                    color: textGrayColor,
                    text: AppLocalizations.of(context)!.translate("statistics"),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height / 40.6, //10
        )
      ],
    );
  }
}
