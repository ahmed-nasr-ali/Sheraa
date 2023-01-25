import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class FilterWithPrice extends StatefulWidget {
  const FilterWithPrice({Key? key}) : super(key: key);

  @override
  State<FilterWithPrice> createState() => _FilterWithPriceState();
}

class _FilterWithPriceState extends State<FilterWithPrice> {
  double _width = 0, _height = 0;
  AdsProvider? _adsProvider;
  bool _initialRun = true;
  final TextEditingController priceFromController = TextEditingController();
  final TextEditingController priceToController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _adsProvider = Provider.of<AdsProvider>(context);

      _initialRun = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _width*0.01,vertical: _height*0.01),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: _width * 0.02,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.translate("from")),
                SizedBox(
                  width: _width * 0.4,
                ),
                Text(AppLocalizations.of(context)!.translate("to"))
              ],
            ),
          ),
          SizedBox(
            height: _height*0.01,
          ),
          Row(
            children: [
              Flexible(
                  child: Container(
                width: _width * 0.4,
                child: CustomTextFormField(
                  readOnly: false,
                  enableBorder: false,
                  containerUnselectedColor: whiteColor,
                  inputData: TextInputType.number,
                  controller: priceFromController,
                ),
              )),
              Flexible(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: _width * 0.05),
                width: _width * 0.4,
                child: CustomTextFormField(
                  readOnly: false,
                  enableBorder: false,
                  containerUnselectedColor: whiteColor,
                  inputData: TextInputType.number,
                  controller: priceToController,
                ),
              )),
              Text(
                AppLocalizations.of(context)!.translate("rial"),
                style: TextStyle(
                  color: textGrayColor,
                  fontSize: 14,
                ),
              )
            ],
          ),
          priceFromController.text.length != 0 &&
                  priceToController.text.length != 0
              ? Container(
            margin: EdgeInsets.symmetric(horizontal: _width*0.02,vertical: _height*0.01),
                child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        priceFromController.text  ,
                        style: TextStyle(
                          color: textGrayColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        priceToController.text  ,
                        style: TextStyle(
                          color: textGrayColor,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
              )
              : Container(),
          priceFromController.text.length != 0 &&
                  priceToController.text.length != 0
              ? Image.asset("assets/images/price.png")
              : Container()
        ],
      ),
    );
  }
}
