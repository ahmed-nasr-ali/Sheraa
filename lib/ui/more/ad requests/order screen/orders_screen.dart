// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/ad%20requests/order%20screen/order%20question%20screen/order_question_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context)),
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
                            Slidable(
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
                                child: orderlist(index, _height, _width)),
                          ],
                        );
                      },
                      childCount: _myads.length,
                    ),
                  ),
                ],
              ),
            ),
            buildActionButton(_height, _width)
          ],
        ),
      ),
    );
  }

  Widget orderlist(int index, double _height, double _width) {
    return Column(
      children: [
        SizedBox(
          height: _height / 67.66666666667,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width / 23.4375),
          child: Row(
            children: [SmallText(text: "شقق - بيع - الرياض - العليا")],
          ),
        ),
        SizedBox(
          height: _height / 50.75,
        ),
        Divider(
          height: 0,
          thickness: 0,
        )
      ],
    );
  }

  Widget buildActionButton(
    double _height,
    double _width,
  ) {
    return Column(
      children: [
        SizedBox(
          height: _height / 81.2,
        ),
        CustomButton(
          enableVerticalMargin: false,
          enableHorizontalMargin: false,
          horizontalMargin: _width / 12.5, //30
          width: _width / 1.19047619047619, //315
          height: _height / 18.04444444444444, //45
          btnLbl: AppLocalizations.of(context)!.translate("add"),
          onPressedFunction: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             AddMoreInformationScreen()));
          },
          btnColor: whiteColor,
          btnStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainAppColor,
              fontSize: _height / 67.66666666666667),
          borderColor: mainAppColor,
        ),
        SizedBox(
          height: _height / 40.3, //40
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => OrderQuestionScreen()));
          },
          child: Container(
              width: _width / 12.5,
              height: _height / 27.06666666666667,
              child: Image.asset("assets/images/question-fill.png")),
        ),
        SizedBox(
          height: _height / 54.13333333333333, //40
        ),
      ],
    );
  }
}
