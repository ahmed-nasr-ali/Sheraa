// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/ad_name_and_decrbtion_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/ad%20name%20and%20describtion%20screen/ad_name_and_decribtion_body.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdNameAndDescribtionScreen extends StatelessWidget {
  AdNameAndDescribtionScreen({Key? key}) : super(key: key);

  double? _height;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _adsName = TextEditingController();
  TextEditingController _adsDescribtion = TextEditingController();

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
            text: AppLocalizations.of(context)!.translate('ads_informations'),
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
              child: AdNameAndDescribtionBody(
                formKey: _formKey,
                adsName: _adsName,
                adsDescribtion: _adsDescribtion,
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: CustomButton(
                  btnLbl: 'التالي',
                  onPressedFunction: () {
                    if (_formKey.currentState!.validate()) {
                      AdNameAndDecribtionController.onTapToNavigate(
                          context, _adsName.text, _adsDescribtion.text);
                    }
                  },
                  btnColor: whiteColor,
                  btnStyle: TextStyle(color: mainAppColor, fontSize: 16),
                  borderColor: mainAppColor),
            ),
          ],
        ),
      ),
    ));
  }
}
