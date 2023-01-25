import 'package:flutter/material.dart';
import 'package:sheraa/ui/ad/adding_ad_screen.dart';
import 'package:sheraa/ui/all_ads/all_ads.dart';
import 'package:sheraa/ui/messages/message%20screen/messages_screen.dart';
import 'package:sheraa/ui/more/more_screen.dart';
import 'package:sheraa/ui/new%20Home/presentation/pages/home%20screen/new_home_screen.dart';
import 'package:sheraa/ui/notification/notifications_screen.dart';
import '../ui/home/home_page.dart';
// import 'package:haraj/ui/ad/adding_ad_screen.dart';
// import 'package:haraj/ui/chat/chat_screen.dart';
// import 'package:haraj/ui/favorites/favorites_screen.dart';
// import 'package:haraj/ui/home/home_screen.dart';
// import 'package:haraj/ui/more/more_screen.dart';

class NavigationProvider extends ChangeNotifier {
  int _navigationIndex = 0;
  bool allAdsTapped = false;
  void setAllAdsTapping(bool tapped) {
    allAdsTapped = tapped;
    notifyListeners();
  }

  bool get allAdsTapping => allAdsTapped;
  void upadateNavigationIndex(int value) {
    _navigationIndex = value;
    notifyListeners();
  }

  int get navigationIndex => _navigationIndex;

  List<Widget> _screens = [
    // HomeScreen(),
    NewHomeScreen(),
    NotificationScreen(),
    AddingAdScreen(),
    MessagesScreen(),
    MoreScreen()
  ];

  List<Widget> screensWithAds = [
    AllAdsScreen(),
    NotificationScreen(),
    AddingAdScreen(),
    MessagesScreen(),
    MoreScreen()
  ];

  Widget get selectedContent {
    if (allAdsTapped) {
      _screens.removeAt(0);
      _screens.insert(0, AllAdsScreen());

      // return screensWithAds[navigationIndex];
      print('index in content: $_navigationIndex');
      return _screens[_navigationIndex];
    } else
      _screens.removeAt(0);
    _screens.insert(0, NewHomeScreen());

    return _screens[_navigationIndex];
  }

  bool _isVisble = true;

  void updateNavigationBarVisbltiy(bool value) {
    _isVisble = value;
    notifyListeners();
  }

  bool get isVisble => _isVisble;
}
