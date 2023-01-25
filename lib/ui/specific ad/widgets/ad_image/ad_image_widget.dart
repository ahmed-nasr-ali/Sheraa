// ignore_for_file: unused_field, must_be_immutable, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/succes%20operation%20bottom%20sheet/succes_operation.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/controller/favorite_ad_controller.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/favorite_ad_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/create_deep_link_for_ad_controller.dart';
import 'package:sheraa/utils/app_colors.dart';

import '../../../../custom_widgets/TextStyle/small_text.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class AdImageWidget extends StatefulWidget {
  int adId;
  List adImages;
  bool isFavorteAd;
  AdImageWidget({
    Key? key,
    required this.adId,
    required this.adImages,
    required this.isFavorteAd,
  }) : super(key: key);

  @override
  State<AdImageWidget> createState() => _AdImageWidgetState();
}

class _AdImageWidgetState extends State<AdImageWidget> {
  int _currentIndex = 0;

  double? _height;

  double? _width;

  FavoriteAdUpdateUiProvider? _favoriteAdUpdateUiProvider;

  @override
  void initState() {
    super.initState();

    Provider.of<FavoriteAdProvider>(context, listen: false)
        .setIsFavorite(widget.isFavorteAd);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkIfFavoriteAdOrNot();
  }

  Future checkIfFavoriteAdOrNot() async {
    print("check is favorite======================");
    await FavoriteAdCOntroller.checkIfAdIsFavorteOrNot(context, widget.adId);
  }

  @override
  Widget build(BuildContext context) {
    print("favorite ad rebuild");
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          children: [
            widget.adImages.isEmpty
                ? Container(
                    width: _width,
                    height: _height! / 4.06, //200,
                    child: Center(
                      child: CustomButton(
                        enableVerticalMargin: false,
                        enableHorizontalMargin: false,
                        width: _width! / 2.205882352941176, //180
                        height: _height! / 23.2, //35
                        btnLbl: AppLocalizations.of(context)!
                            .translate("Request photo for ad"),
                        onPressedFunction: () {},
                        btnColor: mainAppColor,
                        btnStyle: TextStyle(
                            color: whiteColor,
                            fontSize: _height! / 67.66666666666667),
                        borderColor: mainAppColor,
                      ),
                    ),
                  )
                : CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 4.06, //200
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 5),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    items: map(
                      widget.adImages,
                      (index, i) {
                        index = _currentIndex;
                        return Container(
                          width: _width,
                          height: _height! / 4.06, //200,
                          decoration: BoxDecoration(
                            color: mainAppColor,
                            image: DecorationImage(
                              image: NetworkImage(widget.adImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            widget.adImages.isEmpty
                ? Container()
                : Positioned(
                    left: (_width! / 2) - _width! / 25, //15
                    bottom: _height! / 162.4,
                    child: SmallText(
                        text: ("${(_currentIndex + 1).toString()} ") +
                            AppLocalizations.of(context)!.translate("from") +
                            " ${widget.adImages.length}"),
                  ),
            widget.adImages.isEmpty
                ? Container()
                : Positioned(
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
                      child:
                          Image.asset("assets/images/arrow_simple_chock.png")),
                )),
            Provider.of<FavoriteAdProvider>(context, listen: false)
                        .isFavoriteAd ==
                    true
                ? Positioned(
                    left: _width! / 6.048387096774194, //57
                    top: _height! / 54.13333333333333, //15,
                    child: InkWell(
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
                                child: successOperation(
                                    adId: widget.adId,
                                    comesFrom: "Ad Page",
                                    operationName:
                                        "Are you sure to delete this ad from your favorite ads"),
                              );
                            }).then((value) {
                          setState(() {});
                        });
                      },
                      child: Container(
                          width: _width! / 11.71875, //32
                          height: _height! / 25.375, //32
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                          ),
                          child: Image.asset(
                              "assets/images/vuesax-bold-heart.jpg")),
                    ),
                  )
                : Positioned(
                    left: _width! / 6.048387096774194, //57
                    top: _height! / 54.13333333333333, //15,
                    child: GestureDetector(
                      onTap: () async {
                        Map<String, dynamic> _body = {
                          "ad_id": widget.adId,
                        };
                        FavoriteAdCOntroller.addingAdToFavoriteAdListMethod(
                          context,
                          _body,
                          widget.adId,
                        ).then((value) {
                          setState(() {});
                        });
                      },
                      child: Container(
                        width: _width! / 11.71875, //32
                        height: _height! / 25.375, //32
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Image.asset("assets/images/heart.png"),
                      ),
                    ),
                  ),
            Positioned(
                left: _width! / 15, //25
                top: _height! / 54.13333333333333, //15
                child: InkWell(
                  onTap: () async {
                    CreateDeepLinkForAdController.createDeeepLink(widget.adId);
                  },
                  child: Container(
                      width: _width! / 11.71875, //32
                      height: _height! / 25.375, //32
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Image.asset("assets/images/blutooth.png")),
                ))
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Container(
                        width: _width! / 3.472222222222222, //108
                        height: _height! / 10.15, //80
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_height! / 81.2),
                          image: DecorationImage(
                              image: NetworkImage(widget.adImages[0]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _width! / 37.5,
                    ),
                    widget.adImages.length > 1
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = 1;
                              });
                            },
                            child: Container(
                              width: _width! / 3.472222222222222, //108
                              height: _height! / 10.15, //80
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height! / 81.2),
                                image: DecorationImage(
                                    image: NetworkImage(widget.adImages[1]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: _width! / 37.5,
                    ),
                    widget.adImages.length > 2
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = 2;
                              });
                            },
                            child: Container(
                              width: _width! / 3.472222222222222, //108
                              height: _height! / 10.15, //80
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height! / 81.2),
                                image: DecorationImage(
                                    image: NetworkImage(widget.adImages[2]),
                                    fit: BoxFit.cover),
                              ),
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
