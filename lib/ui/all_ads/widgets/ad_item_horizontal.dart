import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdItemHorizontal extends StatefulWidget {
  final Ad ad;
  const AdItemHorizontal({Key? key, required this.ad}) : super(key: key);

  @override
  State<AdItemHorizontal> createState() => _AdItemHorizontalState();
}

class _AdItemHorizontalState extends State<AdItemHorizontal> {
  AdsProvider? _adsProvider;
  bool _initialRun = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _adsProvider = Provider.of<AdsProvider>(context);
      print("view is${_adsProvider!.isChangingAdView}");
      _initialRun = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      //height: height * 0.25,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => SpecificAdScreenDetails(
          //       pageName: "notmoreInformation", //moreInformation (second case)
          //       isMyAd: false,
          //       adDetails: widget.ad,
          //     ),
          //   ),
          // );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => SpecificAdScreenDetails(
          //         isHome: true,
          //         pageName:
          //             "notmoreInformation", //moreInformation (second case)
          //         isMyAd: false,
          //         id: widget.ad.id ?? 0,
          //         //  widget.activeAd[index]["id"],
          //         adImages: widget.ad.image!,
          //         // adImages,
          //         adViews: widget.ad.views ?? 0,
          //         // widget.activeAd[index]["views"] ?? "",
          //         adName: widget.ad.name ?? "",
          //         // widget.activeAd[index]["name"] ?? "",
          //         adOptions: widget.ad.selection!,
          //         // widget.activeAd[index]["selection"] ?? [],
          //         adDescribtion: widget.ad.description ?? "",
          //         // widget.activeAd[index]["description"] ?? "",
          //         adPrice: widget.ad.price ?? "",
          //         //  widget.activeAd[index]["price"] ?? "",
          //         adCity: widget.ad.city?.name ?? "",
          //         // widget.activeAd[index]["city"] ?? "",
          //         adArea: widget.ad.area?.name ?? "",
          //         // widget.activeAd[index]["area"]["name"] ?? "",
          //         userName: widget.ad.user?.name ?? "",
          //         // widget.activeAd[index]["user"]["name"] ?? "",
          //         userImageUrl: widget.ad.user?.avatar ?? "",
          //         //  widget.activeAd[index]["user"]
          //         //         ["avatar"] ??
          //         //     "",
          //         userCreatedAt: widget.ad.user?.createdAt.toString() ??
          //             "", //  widget.activeAd[index]["user"]
          //         //         ["created_at"] ??
          //         //     "",
          //         userLocaledType: widget.ad.user?.type ?? ""
          //         //  widget.activeAd[index]["user"]
          //         //         ["localed_type"] ??
          //         //     "",
          //         ),
          //   ),
          // );
        },
        child: Column(
          children: [
            _adsProvider!.isChangingAdView == false
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          widget.ad.image!.length != 0
                              ? Container(
                                  height: height * 0.14,
                                  width: width * 0.3,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.02),
                                  decoration: BoxDecoration(
                                      color: accentColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            widget.ad.image![0],
                                            // fit: BoxFit.cover,
                                          ))),
                                )
                              : Container(
                                  height: height * 0.14,
                                  width: width * 0.3,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.02),
                                  decoration: BoxDecoration(
                                    color: accentColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/logo.png",
                                        color: grayColor,
                                        height: 50,
                                        width: 50,
                                      ),
                                      SmallText(
                                        text: "لا يوجد صور",
                                        color: textGrayColor,
                                      )
                                    ],
                                  ),
                                ),
                          widget.ad.type == "normal"
                              ? Positioned(
                                  right: width * 0.017,
                                  top: height * 0.017,
                                  child: Container(
                                    width: width * 0.12,
                                    height: height * 0.04,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 1), //20
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[
                                            700], //todo color depend on data base
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  77.2),
                                          bottomLeft: Radius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  77.2), //10
                                        )),
                                    child: Center(
                                      child: SmallText(
                                        text: widget.ad.type.toString(),
                                        color: Colors.black54,
                                        size: 13,
                                        //  size: MediaQuery.of(context).size.height / 55.14, //14
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    child: Text(
                                      widget.ad.name.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          height: 1.4,
                                          color: blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/store.png"),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      widget.ad.user!.name.toString(),
                                      style: TextStyle(
                                          color: hintColor, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      widget.ad.price.toString(),
                                      style: TextStyle(
                                          color: blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("sr"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      widget.ad.city != null
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/location_city.png",
                                    color: mainAppColor,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  SmallText(
                                    text: widget.ad.city!.name.toString(),
                                    color: textGrayColor,
                                  )
                                ],
                              ),
                            )
                          : Container()
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          widget.ad.image!.length != 0
                              ? Center(
                                  child: Container(
                                    height: height * 0.3,
                                    width: width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.02,
                                        vertical: height * 0.01),
                                    decoration: BoxDecoration(
                                        color: accentColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              widget.ad.image![0],
                                              // fit: BoxFit.cover,
                                            ))),
                                  ),
                                )
                              : Container(
                                  // height: height * 0.14,
                                  //  width: width * 0.3,
                                  height: height * 0.25,
                                  width: width,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.02,
                                      vertical: height * 0.01),
                                  decoration: BoxDecoration(
                                    color: accentColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/logo.png",
                                        color: grayColor,
                                        // height: 50,
                                        // width: 50,
                                      ),
                                      SmallText(
                                        text: "لا يوجد صور",
                                        color: textGrayColor,
                                      )
                                    ],
                                  ),
                                ),
                          widget.ad.type != "normal"
                              ? Positioned(
                                  right: 0,
                                  top: height * 0.01,
                                  child: Container(
                                    width: width * 0.15,
                                    height: height * 0.04,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 1), //20
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[
                                            700], //todo color depend on data base
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  77.2),
                                          bottomLeft: Radius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  77.2), //10
                                        )),
                                    child: Center(
                                      child: SmallText(
                                        text: widget.ad.type.toString(),
                                        color: Colors.black54,
                                        size: 13,
                                        //  size: MediaQuery.of(context).size.height / 55.14, //14
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Text(
                              widget.ad.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  height: 1.4,
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/store.png"),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    widget.ad.user!.name.toString(),
                                    style: TextStyle(
                                        color: hintColor, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    widget.ad.price.toString(),
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                Container(
                                    child: Text(
                                  AppLocalizations.of(context)!.translate("sr"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                )),
                              ],
                            ),
                            widget.ad.city != null
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 25),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/location_city.png",
                                          color: mainAppColor,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        SmallText(
                                          text: widget.ad.city!.name.toString(),
                                          color: textGrayColor,
                                        )
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      )
                    ],
                  ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/eye.png",
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    SmallText(
                      text: widget.ad.views.toString(),
                      color: textGrayColor,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/clock.png",
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    SmallText(
                      text:
                          widget.ad.user!.createdAt.toString().substring(0, 10),
                      color: textGrayColor,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/messagesmall.png",
                      //color: mainAppColor,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    SmallText(
                      text: widget.ad.commentsCount.toString(),
                      color: textGrayColor,
                    ),
                  ],
                ),
              ],
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
