// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class MoreItem extends StatefulWidget {
  final String? imgUrl;
  final String? title;
  final bool? setColor;
  final bool? hastrailingImage;
  final bool? hastrailingTilte;
  final String? trailingImageUrl;
  final String? trailingTitle;
  final String? route;
  final bool? hasSwitch;
  bool hasTrailingWidget;
  final Widget? trailingWidget;
  final bool isAuthCheck;

  MoreItem({
    Key? key,
    this.imgUrl,
    this.title,
    this.setColor,
    this.route,
    this.hastrailingImage,
    this.hastrailingTilte,
    this.trailingImageUrl,
    this.trailingTitle,
    this.hasSwitch: false,
    this.hasTrailingWidget = false,
    this.trailingWidget,
    this.isAuthCheck = false,
  }) : super(key: key);

  @override
  _MoreItemState createState() => _MoreItemState();
}

class _MoreItemState extends State<MoreItem> {
  AuthProvider? _authProvider;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    _authProvider = Provider.of<AuthProvider>(context);
    return Container(
      height: 40,
      child: InkWell(
        onTap: () {
          if (widget.isAuthCheck) {
            if (!unAuthUser(context, isHome: true)) {
              Navigator.pushNamed(context, widget.route!);
            }
          } else {
            Navigator.pushNamed(context, widget.route!);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: 8),
                  child: Image.asset(
                    widget.imgUrl!,
                    color: mainAppColor,
                  ),
                ),
                Text(
                  widget.title!,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.hasTrailingWidget
                    ? Container(
                        child: widget.trailingWidget,
                      )
                    : widget.hastrailingImage!
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                // horizontal: width * 0.05,
                                vertical: 8),
                            child: Image.asset(
                              widget.trailingImageUrl!,
                              // color: mainAppColor,
                            ),
                          )
                        : widget.hastrailingTilte!
                            ? Text(
                                widget.trailingTitle!,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              )
                            : Container(),
                widget.hasSwitch!
                    ? Switch(
                        value: _authProvider!.isSwitched,
                        onChanged: _authProvider!.setSwitcher,
                        activeTrackColor: Colors.lightBlueAccent,
                        activeColor: mainAppColor,
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Image.asset(
                          'assets/images/arrow_simple.png',
                          color: secondGrayColor,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
