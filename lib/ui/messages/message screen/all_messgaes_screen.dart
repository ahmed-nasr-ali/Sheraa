// ignore_for_file: must_be_immutable, unused_field, unused_local_variable, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/searching%20bar/seaarching_bar.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/utils/app_colors.dart';

class AllMessagesScreen extends StatefulWidget {
  bool isSearching;
  AllMessagesScreen({
    Key? key,
    required this.isSearching,
  }) : super(key: key);

  @override
  State<AllMessagesScreen> createState() => _AllMessagesScreenState();
}

class _AllMessagesScreenState extends State<AllMessagesScreen> {
  late FocusNode _searchFocusNode;
  final TextEditingController searchController = TextEditingController();

  List _myMessages = [
    1,
    2,
    3,
    4,
    5,
  ];
  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      unAuthUser(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocusNode.dispose();
  }

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
                      SizedBox(
                        height: 0.1,
                      ),
                      Divider(
                        height: 0,
                        color: Color(0xFFEBEBEB),
                      ),
                      SizedBox(
                        height: _height / 67.66666666666667, //12
                      ),
                      widget.isSearching
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: _width / 23.4375, //16
                              ),
                              child: SearchingBar(
                                isHome: false,
                                searchFocusNode: _searchFocusNode,
                                searchController: searchController,
                              ),
                            )
                          : Container(),
                      widget.isSearching
                          ? SizedBox(
                              height: _height / 67.66666666666667, //12
                            )
                          : Container()
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actions: [
                        IconSlideAction(
                          color: Color(0XffF30333),
                          icon: Icons.delete,
                          onTap: () {},
                        )
                      ],
                      // secondaryActions: [
                      //   IconSlideAction(
                      //     color: Color(0XffF30333),
                      //     icon: Icons.delete,
                      //     onTap: () {},
                      //   )
                      // ],
                      child: messageBody(index, _height, _width));
                },
                childCount: _myMessages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageBody(int index, double _height, double _width) {
    return InkWell(
      onTap: () {
        print("ok");
      },
      child: Column(
        children: [
          SizedBox(
            height: _height / 67.66666666666667, //12
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width / 18.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: _width / 16.24, //50
                      backgroundColor: accentColor,
                      backgroundImage:
                          AssetImage("assets/images/userphotoright.png"),
                    ),
                    SizedBox(
                      width: _width / 31.25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: _width / 1.875, //225
                          // color: mainAppColor,
                          child: SmallText(
                            align: TextAlign.start,
                            text: "ماجي رشاد",
                            color: blackColor,
                            size: _height / 67.66666666666667, //12
                            typeOfFontWieght: 1,
                          ),
                        ),
                        SizedBox(
                          height: _height / 162.4,
                        ),
                        Container(
                          width: _width / 1.875, //225
                          // color: mainAppColor,
                          child: SmallText(
                            align: TextAlign.start,
                            text: "مرحبا كيف حالك ارجو ان تكون في احسن حال",
                            color: textGrayColor,
                            size: _height / 81.2, //12
                            typeOfFontWieght: 0,
                          ),
                        ),
                        SizedBox(
                          height: _height / 101.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: _height / 40.6, //225
                              height: _height / 40.6,
                              decoration: BoxDecoration(
                                color: hintColor,
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/white-car.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: _width / 25, //15
                            ),
                            Container(
                              // color: mainAppColor,
                              width: _width / 2.142857142857143, //175
                              child: SmallText(
                                align: TextAlign.start,
                                text: "ساعة يد رقمية وبعقارب اصلية تومي هيلفغر",
                                size: _height / 81.2,
                                color: blackColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SmallText(
                      text: "11/2/2021",
                      size: _height / 67.66666666666667, //12
                    ),
                    SizedBox(
                      height: _height / 162.4,
                    ),
                    Container(
                      width: _height / 47.76470588235294, //17
                      height: _height / 47.76470588235294, //17
                      decoration: BoxDecoration(
                        color: Color(0xFFFED214),
                        shape: BoxShape.circle,
                      ),
                      child: SmallText(
                        align: TextAlign.center,
                        text: "1",
                        size: _height / 90.22222222222222, //9
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: _height / 50.75,
          ),
          index == (_myMessages.length - 1)
              ? Container()
              : Divider(
                  height: 0,
                  color: Color(0xffEBEBEB),
                )
        ],
      ),
    );
  }
}
