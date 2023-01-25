// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class SaveAdImagesWidgets extends StatefulWidget {
  List adImages;

  SaveAdImagesWidgets({
    Key? key,
    required this.adImages,
  }) : super(key: key);

  @override
  State<SaveAdImagesWidgets> createState() => _SaveAdImagesWidgetsState();
}

class _SaveAdImagesWidgetsState extends State<SaveAdImagesWidgets> {
  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        widget.adImages.isEmpty
            ? Container(
                width: _width,
                height: _height! / 5.413333333333333, //200,
                child: Center(
                  child: CustomButton(
                    enableVerticalMargin: false,
                    enableHorizontalMargin: false,
                    width: _width! / 2.205882352941176, //180
                    height: _height! / 23.2, //35
                    btnLbl: AppLocalizations.of(context)!
                        .translate("there is no image"),
                    onPressedFunction: () {},
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(
                        color: whiteColor,
                        fontSize: _height! / 67.66666666666667),
                    borderColor: mainAppColor,
                  ),
                ),
              )
            : Stack(
                children: [
                  Container(
                    width: _width,
                    height: _height! / 5.413333333333333, //150,
                    decoration: BoxDecoration(
                      color: mainAppColor,
                      image: DecorationImage(
                        image: NetworkImage(widget.adImages[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: _width! / 25,
                    bottom: _height! / 35.30434782608696, //23
                    child: Image.asset("assets/images/logowhite.png"),
                  ),
                  Positioned(
                      right: _width! / 19.73684210526316, //19
                      top: _height! / 40.6, //20
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 15,
                            height: 20,
                            child: Image.asset(
                                "assets/images/arrow_simple_chock.png")),
                      )),
                ],
              ),
        SizedBox(
          height: _height! / 81.2,
        ),
        widget.adImages.isEmpty
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _width! / 25, //16
                ),
                child: Row(
                  children: [
                    Container(
                      width: _width! / 3.472222222222222, //108
                      height: _height! / 10.15, //80
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_height! / 81.2),
                        image: DecorationImage(
                            image: NetworkImage(widget.adImages[0]),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: _width! / 37.5,
                    ),
                    widget.adImages.length > 1
                        ? Container(
                            width: _width! / 3.472222222222222, //108
                            height: _height! / 10.15, //80
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(_height! / 81.2),
                              image: DecorationImage(
                                  image: NetworkImage(widget.adImages[1]),
                                  fit: BoxFit.cover),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: _width! / 37.5,
                    ),
                    widget.adImages.length > 2
                        ? Container(
                            width: _width! / 3.472222222222222, //108
                            height: _height! / 10.15, //80
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(_height! / 81.2),
                              image: DecorationImage(
                                  image: NetworkImage(widget.adImages[2]),
                                  fit: BoxFit.cover),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
      ],
    );
  }
}
