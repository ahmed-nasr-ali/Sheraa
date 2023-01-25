// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/adding_ad_method_controller.dart';
import 'package:sheraa/ui/adding%20ad/widgets/adding_ad_item.dart';
import 'package:sheraa/ui/adding%20ad/widgets/request_adding_ad_image_widget.dart';
import 'package:sheraa/ui/adding%20ad/widgets/request_adding_ad_information_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestAddingAdBody extends StatefulWidget {
  RequestAddingAdBody({Key? key}) : super(key: key);

  @override
  State<RequestAddingAdBody> createState() => _RequestAddingAdBodyState();
}

class _RequestAddingAdBodyState extends State<RequestAddingAdBody> {
  double? _width;

  double? _height;

  bool? waitRequest;

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
                  RequestAddingAdImageWidget(),
                  AddAdsItem(
                    rightText:
                        AppLocalizations.of(context)!.translate("_category"),
                    leftText: UserData.getMainCategoryName(),
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: containerColor,
                    endIndent: _width! / 25, //15
                    indent: _width! / 25, //15
                  ),
                  AddAdsItem(
                    rightText: AppLocalizations.of(context)!
                        .translate("sub_department"),
                    leftText: UserData.getSubCategoryName(),
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
                    itemCount: Provider.of<AddOptionsIdAndFeatureName>(context,
                            listen: false)
                        .opttinName
                        .length,
                    itemBuilder: (context, index) {
                      return AddAdsItem(
                        rightText: Provider.of<AddOptionsIdAndFeatureName>(
                                context,
                                listen: false)
                            .opttinName[index]["Feature_Name"],
                        leftText: Provider.of<AddOptionsIdAndFeatureName>(
                                context,
                                listen: false)
                            .opttinName[index]["Selected_Name"],
                      );
                    },
                  ),
                  RequestAddingAdInfromationWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width! / 27.06666666666667,
                    ),
                    child: CustomButton(
                      enableVerticalMargin: false,
                      enableHorizontalMargin: false,
                      width: _width,
                      btnLbl:
                          AppLocalizations.of(context)!.translate("add_ads"),
                      onPressedFunction: () async {
                        setState(() {
                          isLoading = true;
                        });
                        waitRequest =
                            await AddingAdMethodController.addingAdMethod(
                                context);

                        if (waitRequest != null) {
                          if (waitRequest!) {
                            AddingAdMethodController
                                .afterAddingAdSuccufulyNavigateToHome(context);
                          } else if (waitRequest == false) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
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
