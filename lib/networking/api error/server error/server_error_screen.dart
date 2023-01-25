// ignore_for_file: prefer_const_constructors, unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/utils/app_colors.dart';

class ServerError extends StatefulWidget {
  const ServerError({Key? key}) : super(key: key);

  @override
  State<ServerError> createState() => _ServerErrorState();
}

class _ServerErrorState extends State<ServerError> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        backgroundColor: cardColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: BigText(
            typeOfFontWieght: 1,
            text: AppLocalizations.of(context)!.translate("home page"),
          ),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()),
                  (route) => false);
            },
            child: BigText(text: "Releod"),
          ),
        ),
      ),
    );
  }
}
