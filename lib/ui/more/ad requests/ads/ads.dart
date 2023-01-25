// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdsRequest extends StatefulWidget {
  const AdsRequest({Key? key}) : super(key: key);

  @override
  State<AdsRequest> createState() => _AdsRequestState();
}

class _AdsRequestState extends State<AdsRequest> {
  List _myads = [];
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Builder(
      builder: (context) => NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // print("come her");

            ///load next page here
            // _loadMore();
            //romove part of controller from loadmore
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      Divider(
                        height: 0,
                        color: containerColor,
                      ),
                      SizedBox(
                        height: _height / 64.96, //30
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      adlist(index, _height, _width),
                    ],
                  );
                },
                childCount: _myads.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget adlist(int index, double _height, double _width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height / 73.81818181818182, //11
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width / 23.4375, //16
          ),
          child: Row(
            children: [
              Container(
                width: _width / 3.571428571428571, //105
                height: _height / 9.552941176470588, //85
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/images/white-car.png"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: _width / 37.5, //10
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _width / 2.142857142857143, //175
                          child: SmallText(
                            align: TextAlign.start,
                            text: "اوبل استرا توب لاين 2017",
                            color: blackColor,
                            size: _height / 67.66666666666667, //12
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 5),
                        //   child: Container(
                        //     width: _width / 14.42307692307692, //26
                        //     height: _height / 31.23076923076923, //26
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: containerColor),
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: Image.asset(
                        //       "assets/images/heart.png",
                        //       color: Color(0xFF3BBEEF),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                                "assets/images/vuesaxbulkshopremove.png"),
                            SizedBox(
                              width: _width / 125,
                            ),
                            Container(
                              width: _width / 4.411764705882353, //85
                              child: SmallText(
                                align: TextAlign.start,
                                text: "Ghaboor Motor",
                                color: textGrayColor,
                                size: _height / 81.2, //10
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/location.png"),
                            Container(
                              width: _width / 10.71428571428571, //35
                              // color: mainAppColor,
                              child: SmallText(
                                align: TextAlign.start,
                                text: "الرياض",
                                color: textGrayColor,
                                size: _height / 81.2, //10
                              ),
                            ),
                            SizedBox(
                              width: _width / 162.4, //5
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SmallText(
                          align: TextAlign.start,
                          text: "10,000",
                          color: blackColor,
                          typeOfFontWieght: 1,
                          size: _height / 67.66666666666667, //10
                        ),
                        SmallText(
                          text: UserData.getUSerLang() == "ar"
                              ? " ر .س"
                              : " R .S",
                          color: blackColor,
                          size: _height / 67.66666666666667, //12
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height / 58, //14
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height / 81.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width / 11.71875, //32
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/eye.png"),
                  SizedBox(
                    width: _width / 75, //4
                  ),
                  SmallText(
                    text: "3000",
                    color: textGrayColor,
                    size: _height / 81.2,
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/clock.png"),
                  SizedBox(
                    width: _width / 75, //4
                  ),
                  SmallText(
                    text: "11/2/2021",
                    color: textGrayColor,
                    size: _height / 81.2,
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/messagesmall.png"),
                  SizedBox(
                    width: _width / 75, //4
                  ),
                  SmallText(
                    text: "1800",
                    color: textGrayColor,
                    size: _height / 81.2,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: _height / 40.6, //10
        ),
        index == (_myads.length - 1)
            ? Container()
            : Divider(
                height: 0,
                thickness: 5,
                color: accentColor,
              )
      ],
    );
  }
}
