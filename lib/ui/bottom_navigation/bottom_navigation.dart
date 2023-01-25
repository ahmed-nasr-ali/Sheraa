import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/ui/all_ads/all_ads.dart';
//import 'package:haraj/custom_widgets/connectivity/network_indicator.dart';
import '/custom_widgets/safe_area/page_container.dart';
import '/providers/auth_provider.dart';
import '/providers/navigation_provider.dart';
import '/utils/app_colors.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late AuthProvider _authProvider;
  bool _initialRun = true;
  AdsProvider? _adsProvider;
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  // void _iOSPermission() {
  //   _firebaseMessaging.requestNotificationPermissions(
  //       IosNotificationSettings(sound: true, badge: true, alert: true));
  //   _firebaseMessaging.onIosSettingsRegistered
  //       .listen((IosNotificationSettings settings) {
  //     print("Settings registered: $settings");
  //   });
  // }

  // void _iOSPermission() {

  //   _firebaseMessaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     sound: true);

/*    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });*/
//  }

  // void _firebaseCloudMessagingListeners() {
  //   var android = new AndroidInitializationSettings('mipmap/ic_launcher');
  //   var ios = new IOSInitializationSettings();

  //   var platform = new InitializationSettings(android: android, iOS: ios);
  //   _flutterLocalNotificationsPlugin.initialize(platform);

  //   if (Platform.isIOS) _iOSPermission();
/*    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        _showNotification(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');

        Navigator.pushNamed(context, '/notifications_screen');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');

        Navigator.pushNamed(context, '/notifications_screen');
      },
    );*/
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print('on message $message');
  //     _showNotification(message.data);
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('A new onMessageOpenedApp event was published!');
  //     Navigator.pushNamed(context, '/notifications_screen');
  //   });
  // }
  // }

  // _showNotification(Map<String, dynamic> message) async {
  //   var android = new AndroidNotificationDetails(
  //     'channel id',
  //     "CHANNLE NAME",
  //     "channelDescription",
  //   );
  //   var iOS = new IOSNotificationDetails();
  //   var platform = new NotificationDetails(android: android, iOS: iOS);
  //   await _flutterLocalNotificationsPlugin.show(
  //       0,
  //       message['notification']['title'],
  //       message['notification']['body'],
  //       platform);
  // }

  // void _firebaseCloudMessagingListeners() {
  //   var android = new AndroidInitializationSettings('mipmap/ic_launcher');
  //   var ios = new IOSInitializationSettings();
  //   var platform = new InitializationSettings(android: android, iOS: ios);
  //   _flutterLocalNotificationsPlugin.initialize(platform);

  //   if (Platform.isIOS) _iOSPermission();
  //   _firebaseMessaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       print('on message $message');
  //       _showNotification(message);
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       print('on resume $message');

  //       Navigator.pushNamed(context, '/notifications_screen');
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       print('on launch $message');

  //       Navigator.pushNamed(context, '/notifications_screen');
  //     },
  //   );
  // }

  // @override
  // void didChangeDependencies() {
  //   if (_initialRun) {
  //     _authProvider = Provider.of<AuthProvider>(context);
  //     if (_authProvider.currentUser != null) _firebaseCloudMessagingListeners();
  //     _initialRun = false;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    _adsProvider = Provider.of<AdsProvider>(context);
    return NetworkIndicator(child: PageContainer(child:
        Consumer<NavigationProvider>(builder: (context, navigationProvider, _) {
      return Scaffold(
          body: navigationProvider.selectedContent,
          bottomNavigationBar: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height:
                navigationProvider.isVisble ? kBottomNavigationBarHeight : 0,
            child: Wrap(
              children: [
                BottomNavigationBar(
                  backgroundColor: whiteColor,
                  //opacity: .2,
                  currentIndex: navigationProvider.navigationIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    // if (index != 0 && _authProvider.currentUser == null)
                    //   Navigator.pushNamed(context, '/login_screen');
                    // else

                    print(index);
                    if(index==0 && navigationProvider.allAdsTapping==true){
                      navigationProvider.allAdsTapped=false;
                      navigationProvider.upadateNavigationIndex(index);
                    }else
                    navigationProvider.upadateNavigationIndex(index);

                  },
                  elevation: 5,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        //backgroundColor: whiteColor,
                        icon: Image.asset(
                          'assets/images/home.png',
                          // color: secondGrayColor,
                        ),
                        activeIcon: Image.asset('assets/images/home.png',
                            color: mainAppColor),
                        label: AppLocalizations.of(context)!.translate("home")),
                    BottomNavigationBarItem(
                      backgroundColor: whiteColor,
                      icon: Image.asset(
                        'assets/images/notification.png',
                      ),
                      activeIcon: Image.asset('assets/images/notification.png',
                          color: mainAppColor),
                      label: AppLocalizations.of(context)!
                          .translate("notifications"),
                      //style: TextStyle(color: grayColor),
                    ),
                    BottomNavigationBarItem(
                        backgroundColor: whiteColor,
                        icon: Image.asset(
                          'assets/images/add-circle.png',
                        ),
                        activeIcon: Image.asset(
                          'assets/images/add-circle.png',
                        ),
                        label:
                            AppLocalizations.of(context)!.translate("add_ad")),
                    BottomNavigationBarItem(
                        backgroundColor: whiteColor,
                        icon: Image.asset(
                          'assets/images/messages.png',
                        ),
                        activeIcon: Image.asset(
                          'assets/images/messages.png',
                          color: mainAppColor,
                        ),
                        label: AppLocalizations.of(context)!
                            .translate("messages")),
                    BottomNavigationBarItem(
                        backgroundColor: whiteColor,
                        icon: Image.asset(
                          'assets/images/menu.png',
                        ),
                        activeIcon: Image.asset(
                          'assets/images/menu.png',
                          color: mainAppColor,
                        ),
                        label: AppLocalizations.of(context)!.translate("more"))
                  ],
                ),
              ],
            ),
          ));
    })));
  }
}
