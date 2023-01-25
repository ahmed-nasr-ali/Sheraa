// ignore_for_file: must_be_immutable, unnecessary_statements

import 'package:flutter/material.dart';

import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class SearchingBar extends StatefulWidget {
  bool isHome;
  FocusNode searchFocusNode;
  TextEditingController searchController;

  SearchingBar({
    Key? key,
    required this.isHome,
    required this.searchFocusNode,
    required this.searchController,
  }) : super(key: key);

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  @override
  void initState() {
    super.initState();
    widget.searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.isHome ? MediaQuery.of(context).size.height / 101.5 : 0),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / 81.2), //15
      ),
      child: Row(
        children: [
          SizedBox(
            width: widget.isHome
                ? MediaQuery.of(context).size.width / 25
                : MediaQuery.of(context).size.width / 37.5, //10
          ),
          widget.isHome ? Image.asset("assets/images/search.png") : Container(),
          Expanded(
            child: TextField(
              focusNode: widget.searchFocusNode,
              textAlign: TextAlign.start,
              controller: widget.searchController,
              cursorColor: blackColor,
              style: TextStyle(color: blackColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 37.5,
                ),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.isHome
                    ? AppLocalizations.of(context)!
                        .translate("Search in Sheraa Ads")
                    : AppLocalizations.of(context)!.translate("search") + ' ..',
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 64.33, //12
                  fontWeight: FontWeight.normal,
                  color: textGrayColor,
                ),
              ),
              onChanged: (value) {},
              onTap: () {
                setState(() {
                  widget.searchFocusNode.hasFocus == true;
                });
              },
            ),
          ),
          widget.isHome
              ? CircleAvatar(
                  radius:
                      MediaQuery.of(context).size.height / 67.66666666666667,
                  backgroundColor: mainAppColor,
                  backgroundImage: NetworkImage(UserData.getCountryImageUrl()!),
                )
              : Image.asset(
                  "assets/images/search.png",
                  color: textGrayColor,
                ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
