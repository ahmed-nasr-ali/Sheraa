import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class FolloweUsersScreen extends StatefulWidget {
  const FolloweUsersScreen({Key? key}) : super(key: key);

  @override
  State<FolloweUsersScreen> createState() => _FolloweUsersScreenState();
}

class _FolloweUsersScreenState extends State<FolloweUsersScreen> {
  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("assets/images/arrow_simple_chock.png")),
            title: SmallText(
              color: blackColor,
              size: _height! / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!.translate("follower"),
            ),
          ),
          body: Consumer(builder: (context, value, child) {
            return SmallText(text: "text");
          }),
        ),
      ),
    );
  }
}
