// ignore_for_file: unused_local_variable, unused_field, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/report_ad_controller.dart';
import 'package:sheraa/utils/app_colors.dart';
import '../report bottom sheet/report_bottom_sheet.dart';

class ReportAdvertisement extends StatefulWidget {
  int ad_id;
  ReportAdvertisement({
    Key? key,
    required this.ad_id,
  }) : super(key: key);

  @override
  State<ReportAdvertisement> createState() => _ReportAdvertisementState();
}

class _ReportAdvertisementState extends State<ReportAdvertisement> {
  bool _isLoading = false;

  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/images/cancel.png")),
          title: SmallText(
              color: blackColor,
              size: _height! / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!
                  .translate("Report advertisement")),
        ),
        body: _isLoading
            ? Center(
                child: SpinKitFadingCircle(color: mainAppColor),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 0,
                  ),
                  SizedBox(
                    height: _height! / 45.11111111111111, //18
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _width! / 18.75 //20
                            ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            setState(() {});
                            _isLoading = true;
                            Map<String, dynamic> _body = {
                              "ad_id": widget.ad_id,
                              "type": "ad_sold",
                            };
                            bool methodResult =
                                await ReportAdController.reportAdMethod(
                                    context, _body);

                            if (methodResult) {
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: _height! / 11.6, //70
                                width: _width! / 5.357142857142857, //70
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    shape: BoxShape.circle),

                                child: Center(
                                  child: Image.asset(
                                      "assets/images/dollar-square.png"),
                                ),
                              ),
                              SizedBox(
                                height: _height! / 101.5, //8
                              ),
                              SmallText(
                                color: blackColor,
                                size: _height! / 67.66666666666667, //12
                                text: AppLocalizations.of(context)!
                                    .translate("Ad Sold"),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            Map<String, dynamic> _body = {
                              "ad_id": widget.ad_id,
                              "type": "immoral_ad",
                            };
                            bool methodResult =
                                await ReportAdController.reportAdMethod(
                                    context, _body);

                            if (methodResult) {
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: _height! / 11.6, //70
                                width: _width! / 5.357142857142857, //70
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    shape: BoxShape.circle),

                                child: Center(
                                  child:
                                      Image.asset("assets/images/gallery.png"),
                                ),
                              ),
                              SizedBox(
                                height: _height! / 101.5, //8
                              ),
                              SmallText(
                                  color: blackColor,
                                  size: _height! / 67.66666666666667, //12
                                  text: AppLocalizations.of(context)!
                                      .translate("Indecent advertisement"))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            Map<String, dynamic> _body = {
                              "ad_id": widget.ad_id,
                              "type": "an_ad_at_wrong_section",
                            };
                            bool methodResult =
                                await ReportAdController.reportAdMethod(
                                    context, _body);

                            if (methodResult) {
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: _height! / 11.6, //70
                                width: _width! / 5.357142857142857, //70
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    shape: BoxShape.circle),

                                child: Center(
                                  child: Image.asset(
                                      "assets/images/more-square.png"),
                                ),
                              ),
                              SizedBox(
                                height: _height! / 101.5, //8
                              ),
                              SmallText(
                                  color: blackColor,
                                  size: _height! / 67.66666666666667, //12
                                  text: AppLocalizations.of(context)!
                                      .translate("ad in wrong category"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height! / 27.06666666666667, //30
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _width! / 18.75 //20
                            ),
                    child: InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: ReportBottomSheet(
                                  pageName: "not comment_reprot",
                                  titleText: AppLocalizations.of(context)!
                                      .translate("Contrasting advertisement?"),
                                  subtitleText: AppLocalizations.of(context)!
                                      .translate(
                                          "Contrasting advertisement because"),
                                ),
                              );
                            }).then((value) async {
                          if (value != null) {
                            setState(() {
                              _isLoading = true;
                            });
                            print("value is : $value");
                            Map<String, dynamic> _body = {
                              "ad_id": widget.ad_id,
                              "type": "otherwise",
                              "note": value,
                            };
                            bool methodResult =
                                await ReportAdController.reportAdMethod(
                                    context, _body);

                            if (methodResult) {
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: _height! / 11.6, //70
                            width: _width! / 5.357142857142857, //70
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                shape: BoxShape.circle),

                            child: Center(
                              child:
                                  Image.asset("assets/images/more-square.png"),
                            ),
                          ),
                          SizedBox(
                            height: _height! / 101.5, //8
                          ),
                          SmallText(
                              color: blackColor,
                              size: _height! / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("other"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    ));
  }
}
