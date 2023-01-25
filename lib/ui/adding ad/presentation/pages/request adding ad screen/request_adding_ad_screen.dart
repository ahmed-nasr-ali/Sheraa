// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/request%20adding%20ad%20screen/request_adding_ad_body.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestAddingAdScreen extends StatelessWidget {
  RequestAddingAdScreen({Key? key}) : super(key: key);

  double? _height;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              centerTitle: true,
              title: SmallText(
                text: AppLocalizations.of(context)!.translate("Adding Ad"),
                color: blackColor,
                size: _height! / 50.75,
                typeOfFontWieght: 1,
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: blackColor,
                  size: 15,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: RequestAddingAdBody()),
      ),
    );
  }
}
