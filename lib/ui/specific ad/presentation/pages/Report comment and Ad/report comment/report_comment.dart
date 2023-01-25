// ignore_for_file: unused_local_variable, unused_field, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/reports/reports.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/report_comment_controller.dart';
import 'package:sheraa/utils/app_colors.dart';

import '../report bottom sheet/report_bottom_sheet.dart';

class ReportComment extends StatefulWidget {
  int ad_Id;
  int commentId;
  ReportComment({
    Key? key,
    required this.ad_Id,
    required this.commentId,
  }) : super(key: key);

  @override
  State<ReportComment> createState() => _ReportCommentState();
}

class _ReportCommentState extends State<ReportComment> {
  ReportCommentProvider? _reportCommentProvider;

  double? _height;

  double? _width;

  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _reportCommentProvider =
        Provider.of<ReportCommentProvider>(context, listen: false);
  }

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
                    .translate("Report an opposite comment")),
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
                              setState(() {
                                _isLoading = true;
                              });
                              Map<String, dynamic> _body = {
                                "ad_id": widget.ad_Id,
                                "reporter_id": UserData.getUserId(),
                                "comment_id": widget.commentId,
                                "type": "promotional"
                              };

                              ReportCommentController.reportCommentMethod(
                                      context, _body)
                                  .then((value) {
                                if (!value) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: _height! / 11.6, //70
                                  width: _width! / 5.357142857142857, //70
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade200),
                                      shape: BoxShape.circle),

                                  child: Center(
                                    child:
                                        Image.asset("assets/images/dollar.png"),
                                  ),
                                ),
                                SizedBox(
                                  height: _height! / 101.5, //8
                                ),
                                SmallText(
                                    color: blackColor,
                                    size: _height! / 67.66666666666667, //12
                                    text: AppLocalizations.of(context)!
                                        .translate("promotional messages"))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isLoading = true;
                              });
                              Map<String, dynamic> _body = {
                                "ad_id": widget.ad_Id,
                                "reporter_id": UserData.getUserId(),
                                "comment_id": widget.commentId,
                                "type": "impolite "
                              };
                              ReportCommentController.reportCommentMethod(
                                      context, _body)
                                  .then((value) {
                                if (!value) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: _height! / 11.6, //70
                                  width: _width! / 5.357142857142857, //70
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade200),
                                      shape: BoxShape.circle),

                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/gallery.png"),
                                  ),
                                ),
                                SizedBox(
                                  height: _height! / 101.5, //8
                                ),
                                SmallText(
                                    color: blackColor,
                                    size: _height! / 67.66666666666667, //12
                                    text: AppLocalizations.of(context)!
                                        .translate("Indecent reply"))
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
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: ReportBottomSheet(
                                        pageName: "comment_reprot",
                                        titleText: AppLocalizations.of(context)!
                                            .translate("opposite comment ?"),
                                        subtitleText:
                                            AppLocalizations.of(context)!
                                                .translate(
                                          "The Comment is opposite because",
                                        ),
                                      ),
                                    );
                                  }).then((value) {
                                if (value != null) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  print("value is : $value");
                                  Map<String, dynamic> _body = {
                                    "ad_id": widget.ad_Id,
                                    "reporter_id": UserData.getUserId(),
                                    "comment_id": widget.commentId,
                                    "type": "other",
                                    "description": value
                                  };
                                  ReportCommentController.reportCommentMethod(
                                          context, _body)
                                      .then((value) {
                                    if (!value) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  });
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: _height! / 11.6, //70
                                  width: _width! / 5.357142857142857, //70
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade200),
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
                                        .translate("other"))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
