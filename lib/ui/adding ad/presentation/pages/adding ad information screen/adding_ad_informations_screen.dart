// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/ad_information_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/adding%20ad%20information%20screen/adding_Ad_information_body.dart';
import 'package:sheraa/utils/app_colors.dart';

class AddingAdInformationScreen extends StatelessWidget {
  AddingAdInformationScreen({Key? key}) : super(key: key);

  double? _height;

  TextEditingController _adsPrice = TextEditingController();

  TextEditingController _phoneNumber = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                child: AddingAdInformationBody(
                  adsPrice: _adsPrice,
                  phoneNumber: _phoneNumber,
                  formKey: _formKey,
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: CustomButton(
                    btnLbl: 'التالي',
                    onPressedFunction: () {
                      if (_formKey.currentState!.validate()) {
                        AdInformationController.onTapToNavigate(
                            context, _adsPrice.text, _phoneNumber.text);
                      }
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
