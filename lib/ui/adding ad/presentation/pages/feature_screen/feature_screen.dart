// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/feature_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/feature_screen/list_of_feature_ui.dart';
import 'package:sheraa/utils/app_colors.dart';

class FeatureScreen extends StatefulWidget {
  int categoryId;
  FeatureScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
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
              text: AppLocalizations.of(context)!.translate('Other_Details'),
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
          body: Column(
            children: [
              SizedBox(
                height: _height! / 81.2,
              ),
              Divider(
                height: 0,
                color: containerColor,
              ),
              Expanded(
                child: ListOfFeatureUi(
                  categoryId: widget.categoryId,
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: CustomButton(
                    btnLbl: 'التالي',
                    onPressedFunction: () {
                      FeatureController.onTapOnCategoryAction(context);
                      setState(() {});
                    },
                    btnColor: whiteColor,
                    btnStyle: TextStyle(color: mainAppColor, fontSize: 16),
                    borderColor: mainAppColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
