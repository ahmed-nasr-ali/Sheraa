// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/messages/message%20screen/all_messgaes_screen.dart';
import 'package:sheraa/ui/messages/message%20setting/message_setting.dart';
import 'package:sheraa/utils/app_colors.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool _isSearch = false;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return NetworkIndicator(
      child: PageContainer(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    actions: [
                      InkWell(
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
                                  child: MessageSetting(),
                                );
                              });
                        },
                        child: Image.asset(
                          "assets/images/menu-dots.png",
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        width: _width / 18.75, //20
                      )
                    ],
                    pinned: true,
                    floating: true,
                    snap: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 0,
                    centerTitle: true,
                    leading: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            _isSearch = !_isSearch;
                          });
                        },
                        icon: Image.asset(_isSearch
                            ? "assets/images/cancel.png"
                            : "assets/images/search.png")),
                    title: SmallText(
                        color: blackColor,
                        size: _height / 50.75, //16
                        typeOfFontWieght: 1,
                        text: AppLocalizations.of(context)!
                            .translate("messages")),
                    bottom: TabBar(
                        indicatorWeight: 3,
                        indicatorColor: mainAppColor,
                        indicatorPadding:
                            EdgeInsets.symmetric(horizontal: _width / 12.5),
                        labelColor: mainAppColor,
                        unselectedLabelColor: textGrayColor,
                        labelStyle: TextStyle(
                          fontFamily: 'RB',
                          fontWeight: FontWeight.bold,
                          fontSize: _height / 58, //14
                          overflow: TextOverflow.ellipsis,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontFamily: 'RB',
                          fontWeight: FontWeight.normal,
                          fontSize: _height / 58, //14
                          overflow: TextOverflow.ellipsis,
                        ),
                        tabs: [
                          Tab(
                            text: AppLocalizations.of(context)!
                                .translate("All Messages"),
                          ),
                          Tab(
                            text: AppLocalizations.of(context)!
                                .translate("Unread messages"),
                          )
                        ]),
                  ),
                ),
              ],
              body: TabBarView(
                children: [
                  AllMessagesScreen(
                    isSearching: _isSearch,
                  ),
                  AllMessagesScreen(
                    isSearching: _isSearch,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
