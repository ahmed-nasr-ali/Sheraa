// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';

import 'package:sheraa/ui/adding%20ad/widgets/adding_ad_item.dart';
import 'package:sheraa/ui/more/my%20ads/edit%20ad/widgets/edit_ad_images_widget.dart';
import 'package:sheraa/ui/more/my%20ads/edit%20ad/widgets/edit_ad_information.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

class EditAdBody extends StatefulWidget {
  AdEntity adDetails;
  EditAdBody({
    Key? key,
    required this.adDetails,
  }) : super(key: key);

  @override
  State<EditAdBody> createState() => _EditAdBodyState();
}

class _EditAdBodyState extends State<EditAdBody> {
  double? _width;

  double? _height;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return isLoading
        ? Center(
            child: SpinKitFadingCircle(color: mainAppColor),
          )
        : ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditAdImageWidget(
                    adImage: widget.adDetails.image ?? [],
                  ),
                  AddAdsItem(
                    rightText:
                        AppLocalizations.of(context)!.translate("_category"),
                    leftText: widget.adDetails.category!.name ?? "",
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: containerColor,
                    endIndent: _width! / 25, //15
                    indent: _width! / 25, //15
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        indent: _width! / 37.5,
                        endIndent: _width! / 37.5,
                      );
                    },
                    itemCount: widget.adDetails.singleSelection!.length,
                    itemBuilder: (context, index) {
                      return AddAdsItem(
                        rightText: widget.adDetails.singleSelection![index]
                                .featureName ??
                            "",
                        leftText: widget
                                .adDetails.singleSelection![index].optionName ??
                            "",
                      );
                    },
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: containerColor,
                    endIndent: _width! / 25, //15
                    indent: _width! / 25, //15
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        indent: _width! / 37.5,
                        endIndent: _width! / 37.5,
                      );
                    },
                    itemCount: widget.adDetails.multiSelection!.length,
                    itemBuilder: (context, index) {
                      return AddAdsItem(
                        rightText: widget
                                .adDetails.multiSelection![index].featureName ??
                            "",
                        leftText: widget
                                .adDetails.multiSelection![index].optionName ??
                            "",
                      );
                    },
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: containerColor,
                    endIndent: _width! / 25, //15
                    indent: _width! / 25, //15
                  ),
                  //Area
                  AddAdsItem(
                    rightText: AppLocalizations.of(context)!.translate("city"),
                    leftText: widget.adDetails.city!.name ?? "",
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: containerColor,
                    endIndent: _width! / 25, //15
                    indent: _width! / 25, //15
                  ),
                  AddAdsItem(
                    rightText: AppLocalizations.of(context)!.translate("Area"),
                    leftText: widget.adDetails.area!.name ?? "",
                  ),
                  EditAdInformation(
                    adInfromations: widget.adDetails,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width! / 27.06666666666667,
                    ),
                    child: CustomButton(
                      enableVerticalMargin: false,
                      enableHorizontalMargin: false,
                      width: _width,
                      btnLbl:
                          AppLocalizations.of(context)!.translate('Edit Ad'),
                      onPressedFunction: () async {},
                      btnColor: whiteColor,
                      btnStyle: TextStyle(color: mainAppColor, fontSize: 16),
                      borderColor: mainAppColor,
                    ),
                  ),
                  SizedBox(
                    height: _height! / 16.24,
                  )
                ],
              ),
            ],
          );
  }
}
