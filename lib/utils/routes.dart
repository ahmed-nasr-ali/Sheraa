import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/ui/choose_country/choose_country.dart';
import 'package:sheraa/ui/gender/select_gender.dart';
import 'package:sheraa/ui/language/language_screen.dart';
import 'package:sheraa/ui/more/Join%20our%20team/Join%20our%20team%20screen/Join_our_team_screen.dart';
import 'package:sheraa/ui/more/Points%20earned%20system/Points_earned_system_screen.dart';
import 'package:sheraa/ui/more/account%20types/account%20types%20screen/account_types_screen.dart';
import 'package:sheraa/ui/more/choose%20city%20in%20more/choose_city_in_more_screen.dart';
import 'package:sheraa/ui/more/choose%20country%20in%20more%20screen/choose_country_in_more_screen.dart';
import 'package:sheraa/ui/splash/splash_screen.dart';

final routes = {
  '/': (context) => SplashScreen(),
  '/choose_language': (context) => ChooseLanguageScreen(),
  '/choose_country': (context) => ChooseCountryScreen(),
  '/select_gender': (context) => SelectGenderScreen(),
  '/bottom_navigation': (context) => BottomNavigation(),
  '/PointsEarnedSystem': (context) => PointsEarnedSystemScreen(),
  '/AccountTypes': (context) => AccountTypesScreen(),
  '/choose_countrt_in_more': (context) => ChooseCountryInMoreScreen(),
  '/choose_city_in_more': (context) => ChooseCityInMoreScreen(),
  '/Join_our_team_screen': (context) => JoinOurteamScreen(),
};
