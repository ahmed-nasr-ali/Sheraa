import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/ui/notification/notifications_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackBtn;
  final String title;
   final  Widget? leadingWidget;
  final Widget? trailingWidget;
  final Function backButtonAction;
  final bool hasDrawer;
  final bool hasnotification;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool hasCenterLogo;
  @override
  final Size preferredSize;

  const CustomAppbar(
      {this.hasDrawer: false,
      required this.hasCenterLogo,
      this.hasnotification: false,
      this.scaffoldKey,
      this.hasBackBtn: false,
       this.leadingWidget,
      required this.title,
       required this.backButtonAction,
      this.preferredSize: const Size.fromHeight(50.0),
     this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    // NotificationsProvider _notificationsProvider;
    // _notificationsProvider = Provider.of<NotificationsProvider>(context);
    // _notificationsProvider.getNotificationList(context);
    // _notificationsProvider.getUnreadNotificationCount();
    // print('count${_notificationsProvider.notificationCount}');
    return Container(
      width: MediaQuery.of(context).size.width,

      //color: mainAppColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leadingWidget != null) leadingWidget! else hasBackBtn
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: blackColor,
                        size: 15,
                      ),
                       onPressed: (){
                        backButtonAction();

                       }


                      //    if(backButtonAction!=null)
                      //      backButtonAction;
                      //    else Navigator.pop(context);
                      //
                      // }
                      )
                  : Container(),
          Spacer(
            flex: 3,
          ),
          hasCenterLogo
              ? Container(
                  child: Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                  width: 100,
                ))
              : Text(title, style: TextStyle(fontSize: 16, color: blackColor,fontWeight: FontWeight.bold)),
          Spacer(
            flex: 3,
          ),
          if (hasnotification) IconButton(
                  icon: Badge(
                      position: BadgePosition.topStart(start: -12, top: -12),
                      toAnimate: false,
                      badgeColor: Colors.black,
                      badgeContent: Text(
                        // notifiProvider.notificationCount != 0
                        //     ? notifiProvider.notificationCount.toString()
                        // :
                        '0',
                        // "0",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      child: Image.asset(
                        'assets/images/notifi.png',
                      )),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => NotificationScreen()));
                  }) else if( trailingWidget != null)
                   trailingWidget!
                  else Container(
                      width: 20,
                    ),
        ],
      ),
    );
  }
}
