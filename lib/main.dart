import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/networking/api%20error/auth/api_errors.dart';
import 'package:sheraa/networking/api%20error/error%20403/403_error.dart';
import 'package:sheraa/networking/api%20error/server%20error/server_error.dart';
import 'package:sheraa/providers/account%20upgrade/account_upgrade_provider.dart';
import 'package:sheraa/providers/active%20and%20unactive%20ad%20provider/inactive_ad_provider.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/providers/comments%20and%20replies%20provider/comments_replies_provider.dart';
import 'package:sheraa/providers/countries_provider.dart';
import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
import 'package:sheraa/providers/firebase_auth_provider.dart';
import 'package:sheraa/providers/follow%20methods/follow_methods.dart';
import 'package:sheraa/providers/get%20specific%20ad/get_specific_ad_provider.dart';
import 'package:sheraa/providers/increase%20views/increase_views_provider.dart';
import 'package:sheraa/providers/media_provider.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/providers/reports/reports.dart';
import 'package:sheraa/providers/theme_provider.dart';
import 'package:sheraa/providers/user%20profile%20data/user_profile_data.dart';
import 'package:sheraa/shared_preferences/add_adds.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/theme/style.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_method_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_option_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/deleting_from_provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/active_ads_provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/deleting_ad_provider.dart';
import 'package:sheraa/utils/injection/injection_container.dart' as di;
import 'package:sheraa/utils/routes.dart';

import 'locale/app_localizations.dart';
import 'locale/locale_helper.dart';
import 'providers/active and unactive ad provider/active_ad_provider.dart';
import 'providers/add ads/add_ads_provider.dart';
import 'ui/adding ad/presentation/provider/adding_ad_area_provider.dart';
import 'ui/adding ad/presentation/provider/adding_ad_cities_provider.dart';
import 'ui/adding ad/presentation/provider/feature_provider.dart';
import 'ui/adding ad/presentation/provider/main_category_provider.dart';
import 'ui/more/favorite ads/presentation/provider/adding_tofavorite_provider.dart';
import 'ui/more/favorite ads/presentation/provider/favorite_ad_provider.dart';
import 'ui/more/user profile/presentation/providers/follow_mehtod_provider.dart';
import 'ui/more/user profile/presentation/providers/get_current_user_provider.dart';
import 'ui/more/user profile/presentation/providers/get_followers_users_provider.dart';
import 'ui/more/user profile/presentation/providers/get_following_users_provider.dart';
import 'ui/more/user profile/presentation/providers/update_current_user_data.dart';
import 'ui/new Home/presentation/providers/all_ads_provider.dart';
import 'ui/new Home/presentation/providers/get_specific_ad_provider.dart';
import 'ui/new Home/presentation/providers/slider_image_provider.dart';
import 'ui/new Home/presentation/providers/store_icon_provider.dart';
import 'ui/specific ad/presentation/providers/get_all_comments_provider.dart';
import 'ui/specific ad/presentation/providers/report_ad_provider.dart';
import 'ui/specific ad/presentation/providers/report_comment_provider.dart';
import 'ui/specific ad/presentation/providers/send_comment_provider.dart';
import 'ui/specific ad/presentation/providers/send_reply_comment_provider.dart';
import 'ui/specific ad/presentation/providers/tell_me_when_price_decrease_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserData.init();
  await di.init();
  await addAddsSharedPreferences.init();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    run();
  });
}

void run() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  onLocaleChange(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Future<void> _getLanguage() async {
    String language = await SharedPreferencesHelper.getUserLang();
    print('lan:$language');
    onLocaleChange(Locale(language));
  }

  @override
  void initState() {
    super.initState();
    helper.onLocaleChanged = onLocaleChange;
    _locale = new Locale('en');
    _getLanguage();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, CountriesProvider>(
          create: (_) => CountriesProvider(),
          update: (_, auth, countriesProvider) =>
              countriesProvider!..update(auth),
        ),
        ChangeNotifierProxyProvider<AuthProvider, AdsProvider>(
          create: (_) => AdsProvider(),
          update: (_, auth, countriesProvider) =>
              countriesProvider!..update(auth),
        ),
        ChangeNotifierProvider(
          create: (_) => FirebaseAutProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthError(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeServerError(),
        ),
        ChangeNotifierProvider(
          create: (_) => Error403(),
        ),

        ChangeNotifierProvider(
          create: (_) => MediaProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ActiveAdProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UnActiveAdProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RepliesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CommentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ReportCommentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddAdToFavoriteAdList(),
        ),
        ChangeNotifierProvider(
          create: (_) => DeleteAdFromFavoriteAdList(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteAdUpdateUiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetAllMyFavoriteAdsListProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => ReportAdProvider(),
        // ),
        ChangeNotifierProvider(
          create: (_) => AccountUpgradeProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => GetSpecificAdAndUserAdsProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => AccountUpgradePakageId(),
        ),
        ChangeNotifierProvider(
          create: (_) => AccountUpgradeToSellerOrStore(),
        ),
        ChangeNotifierProvider(
          create: (_) => IncreaseVeiwsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetAllCommentsprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FollowMethodsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddingAdsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddOptionsIdAndFeatureName(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<MainCategoryProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<SubCategoryProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<AddingAdCitiesProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<AddingAdAreaProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<FeatureProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<FeatureOptionProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<AddingAdMethodProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<MyActiveAdsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<DeletingAdProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<GetCurrentUserDataProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<UpdateCurrentUserProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<AdOnHomeScreenProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<SliderListProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<StoreIconProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<GetSpecificAdProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<FavoriteAdProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<FavoriteAdProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<AddingAdToFavoriteAdListProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<DeletingAdFromFavoriteAdListProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<TellMeWhenPriceDecreaseProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<ReportAdProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<SendCommentProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<GetAllCommentsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<ReportCommentsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<SendReplyCommentProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<FollowMehodProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<GetFollowingUsersProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<GetFollowersUsersProvider>(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => di.sl<SendReplyCommentProvider>(),
        // ),

        // ChangeNotifierProxyProvider<AuthProvider, RegisterProvider>(
        //   create: (_) => RegisterProvider(),
        //   update: (_, auth, registerProvider) =>
        //   registerProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, TrainersProvider>(
        //   create: (_) => TrainersProvider(),
        //   update: (_, auth, trainersProvider) =>
        //   trainersProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, NotificationProvider>(
        //   create: (_) => NotificationProvider(),
        //   update: (_, auth, notificationProvider) =>
        //   notificationProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, TrainerDetailsProvider>(
        //   create: (_) => TrainerDetailsProvider(),
        //   update: (_, auth, trainerDetailsProvider) =>
        //   trainerDetailsProvider..update(auth),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => CoursesProvider(),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, GalleryProvider>(
        //   create: (_) => GalleryProvider(),
        //   update: (_, auth, galleryProvider) =>
        //   galleryProvider..update(auth),
        // ),

        // ChangeNotifierProxyProvider<AuthProvider, StaticPagesProvider>(
        //   create: (_) => StaticPagesProvider(),
        //   update: (_, auth, staticPagesProvider) =>
        //   staticPagesProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, OffersProvider>(
        //   create: (_) => OffersProvider(),
        //   update: (_, auth, offerProvider) =>
        //   offerProvider..update(auth),
        // ),
        //   ChangeNotifierProxyProvider<AuthProvider, PackagesProvider>(
        //   create: (_) => PackagesProvider(),
        //   update: (_, auth, packageProvider) =>
        //   packageProvider..update(auth),
        // ),
        //  ChangeNotifierProxyProvider<AuthProvider, PackageDetailsProvider>(
        //   create: (_) => PackageDetailsProvider(),
        //   update: (_, auth, packageDetailsProvider) =>
        //   packageDetailsProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, BlogsProvider>(
        //   create: (_) => BlogsProvider(),
        //   update: (_, auth, blogsProvider) =>
        //   blogsProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, BlogDetailsProvider>(
        //   create: (_) => BlogDetailsProvider(),
        //   update: (_, auth, blogDetailsProvider) =>
        //   blogDetailsProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, CoursesProvider>(
        //   create: (_) => CoursesProvider(),
        //   update: (_, auth, coursesProvider) =>
        //   coursesProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, SubscribeDataProvider>(
        //   create: (_) => SubscribeDataProvider(),
        //   update: (_, auth, subscribeDataProvider) =>
        //   subscribeDataProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, UserProfileProvider>(
        //   create: (_) => UserProfileProvider(),
        //   update: (_, auth, userProfileProvider) =>
        //   userProfileProvider..update(auth),
        // ),

        // ChangeNotifierProxyProvider<AuthProvider, HomeProvider>(
        //   create: (_) => HomeProvider(),
        //   update: (_, auth, homeProvider) =>
        //   homeProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, SingleCourseProvider>(
        //   create: (_) => SingleCourseProvider(),
        //   update: (_, auth, singleCourseProvider) =>
        //   singleCourseProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, LessonProvider>(
        //   create: (_) => LessonProvider(),
        //   update: (_, auth, lessonProvider) =>
        //   lessonProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, SingleCategoryCoursesProvider>(
        //   create: (_) => SingleCategoryCoursesProvider(),
        //   update: (_, auth, singleCategoryCoursesProvider) =>
        //   singleCategoryCoursesProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, SearchProvider>(
        //   create: (_) => SearchProvider(),
        //   update: (_, auth, searchProvider) =>
        //   searchProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, ExamProvider>(
        //   create: (_) => ExamProvider(),
        //   update: (_, auth, examProvider) =>
        //   examProvider..update(auth),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, SocialProvider>(
        //   create: (_) => SocialProvider(),
        //   update: (_, auth, socialProvider) =>
        //   socialProvider..update(auth),
        // ),
      ],
      child: MaterialApp(
        locale: _locale,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Sheraa',
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        routes: routes,
      ),
    );
  }
}
