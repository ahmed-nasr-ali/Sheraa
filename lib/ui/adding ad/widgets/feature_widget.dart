// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/feature_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class FeatureWidget extends StatefulWidget {
  String featureName;
  int featureId;
  String slectType;

  FeatureWidget({
    Key? key,
    required this.featureName,
    required this.featureId,
    required this.slectType,
  }) : super(key: key);

  @override
  State<FeatureWidget> createState() => _FeatureWidgetState();
}

class _FeatureWidgetState extends State<FeatureWidget> {
  double? _height;

  double? _width;

  String? _optionNameSelect;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _width! / 22.05882352941176 //17
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(
            text: widget.featureName,
            color: blackColor, size: _height! / 58, //14
          ),
          SizedBox(
            height: _height! / 81.2, //10
          ),
          InkWell(
            onTap: () async {
              if (widget.slectType == "single") {
                var x = await FeatureController.onTapOnFeature(context,
                    widget.featureName, widget.featureId, widget.slectType);
                print(
                    "============111111111111122222222222222====================");
                print(x);
                if (x != null) {
                  _optionNameSelect = x;
                  setState(() {});
                }
              } else {
                FeatureController.onTapOnFeature(context, widget.featureName,
                    widget.featureId, widget.slectType);
              }
            },
            child: Container(
              alignment: UserData.getUSerLang() == "ar"
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              width: _width!,
              height: _height! / 18.04444444444444, //45
              decoration: BoxDecoration(
                  color: Color(0xFFF8F9FB),
                  borderRadius: BorderRadius.circular(10),
                  border: Provider.of<FeatureProvider>(context, listen: false)
                              .showMessage ==
                          widget.featureName
                      ? Border.all(color: redColor)
                      : Border.all(
                          color: Color(0xFFF8F9FB),
                        )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: _optionNameSelect != null
                          ? _optionNameSelect!
                          : widget.featureName,
                      color:
                          Provider.of<FeatureProvider>(context, listen: false)
                                      .showMessage ==
                                  widget.featureName
                              ? redColor
                              : textGrayColor,
                      size: _height! / 67.66666666666667, //12
                    ),
                    Image.asset(
                      "assets/images/check.png",
                      color:
                          Provider.of<FeatureProvider>(context, listen: false)
                                      .showMessage ==
                                  widget.featureName
                              ? redColor
                              : textGrayColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _height! / 81.2, //10
          )
        ],
      ),
    );
  }
}
