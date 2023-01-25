import 'package:get_it/get_it.dart';
import 'package:sheraa/ui/adding%20ad/data/data%20source/adding_ad_remote_data_source.dart';
import 'package:sheraa/ui/adding%20ad/data/repository/adding_ad_repository_IMP.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/adding_ad_use_case.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/area_use_case.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/cities_use_case.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/feature_option_use_case.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/features_use_case.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/main_category_usecase.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/sub_category_use_case.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_area_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_cities_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_method_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_option_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';
import 'package:sheraa/ui/more/favorite%20ads/data/data%20sources/favorite_ad_remote_data_source.dart';
import 'package:sheraa/ui/more/favorite%20ads/data/repository/favorite_ad_repositoryIMP.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/repository/favorite_ad_repository.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/use%20cases/add_to_favorite_use_case.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/use%20cases/delete_from_favorite_use_case.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/use%20cases/get_all_favorite_ads_use_case.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/adding_tofavorite_provider.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/deleting_from_provider.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/provider/favorite_ad_provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/data/data%20source/my_ads_remote_data_sourcse.dart';
import 'package:sheraa/ui/more/my%20ads/new/data/repository/my_ads_repositoryIMP.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/repository/my_ad_repository.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/use%20case/delete_ad_use_case.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/use%20case/get_active_ads_use_case.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/active_ads_provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/deleting_ad_provider.dart';
import 'package:sheraa/ui/more/user%20profile/data/data%20source/user_remot_data_source.dart';
import 'package:sheraa/ui/more/user%20profile/data/repository/user_repositoryIMP.dart';
import 'package:sheraa/ui/more/user%20profile/domin/repository/user_repositoryt.dart';
import 'package:sheraa/ui/more/user%20profile/domin/use%20case/follow_method_use_case.dart';
import 'package:sheraa/ui/more/user%20profile/domin/use%20case/followers_users_use_case.dart';
import 'package:sheraa/ui/more/user%20profile/domin/use%20case/following_users_use_case.dart';
import 'package:sheraa/ui/more/user%20profile/domin/use%20case/get_current_user_data.dart';
import 'package:sheraa/ui/more/user%20profile/domin/use%20case/update_current_user_use_case.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/follow_mehtod_provider.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/get_current_user_provider.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/get_followers_users_provider.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/get_following_users_provider.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/update_current_user_data.dart';
import 'package:sheraa/ui/new%20Home/data/data%20source/home_screen_remote_data_source.dart';
import 'package:sheraa/ui/new%20Home/data/repository/home_screen_repositoryIMP.dart';
import 'package:sheraa/ui/new%20Home/domine/repository/home_screen_repository.dart';
import 'package:sheraa/ui/new%20Home/domine/use%20case/get_allads_use_case.dart';
import 'package:sheraa/ui/new%20Home/domine/use%20case/get_slider_image_use_case.dart';
import 'package:sheraa/ui/new%20Home/domine/use%20case/get_specific_ad_use_case.dart';
import 'package:sheraa/ui/new%20Home/domine/use%20case/get_store_icons_use_case.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/all_ads_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/get_specific_ad_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/slider_image_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/store_icon_provider.dart';
import 'package:sheraa/ui/specific%20ad/data/data%20source/specific_ad_remote_data_source.dart';
import 'package:sheraa/ui/specific%20ad/data/repository/specific_ad_repositoryIMP.dart';
import 'package:sheraa/ui/specific%20ad/domine/repository/specific_ad_repository.dart';
import 'package:sheraa/ui/specific%20ad/domine/use%20cases/get_all_comments.dart';
import 'package:sheraa/ui/specific%20ad/domine/use%20cases/report_ad_use_case.dart';
import 'package:sheraa/ui/specific%20ad/domine/use%20cases/report_comment_use_case.dart';
import 'package:sheraa/ui/specific%20ad/domine/use%20cases/send_comment_use_case.dart';
import 'package:sheraa/ui/specific%20ad/domine/use%20cases/send_reply_comment_use_case.dart';
import 'package:sheraa/ui/specific%20ad/domine/use%20cases/tellme_when_price_decrease_use_case.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/get_all_comments_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/report_ad_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/report_comment_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/send_comment_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/send_reply_comment_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/tell_me_when_price_decrease_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Home page
  ///===========================================================================
  // providers
  sl.registerFactory(() => AdOnHomeScreenProvider(getAllAdsUseCase: sl()));
  sl.registerFactory(() => SliderListProvider(getSliderImageUseCase: sl()));
  sl.registerFactory(() => StoreIconProvider(storeIconsUseCase: sl()));
  sl.registerFactory(() => GetSpecificAdProvider(getSpecificAdUseCase: sl()));
  // use case
  sl.registerLazySingleton(() => GetAllAdsUseCase(homeScreenRepository: sl()));
  sl.registerLazySingleton(
      () => GetSliderImageUseCase(homeScreenRepository: sl()));
  sl.registerLazySingleton(() => StoreIconsUseCase(homeScreenRepository: sl()));
  sl.registerLazySingleton(
      () => GetSpecificAdUseCase(homeScreenRepository: sl()));
  //repository
  sl.registerLazySingleton<HomeScreenRepository>(
      () => HomeScreenRepositoryIMP(homeScreenRemoteDataSource: sl()));
  //data source
  sl.registerLazySingleton<HomeScreenRemoteDataSource>(
      () => HomeScreenRemoteDataSourceIMP());

  ///Adding Ad
  ///===========================================================================
  // providers
  sl.registerFactory(() => MainCategoryProvider(getMainCategoryUseCase: sl()));
  sl.registerFactory(() => SubCategoryProvider(subCategoryUseCase: sl()));
  sl.registerFactory(() => AddingAdCitiesProvider(citiesUseCase: sl()));
  sl.registerFactory(() => AddingAdAreaProvider(areaUseCase: sl()));
  sl.registerFactory(() => FeatureProvider(featureUseCase: sl()));
  sl.registerFactory(() => FeatureOptionProvider(featureOptionUseCase: sl()));
  sl.registerFactory(() => AddingAdMethodProvider(addingAdUseCase: sl()));
  // use cases
  sl.registerLazySingleton(() => MainCategoryUseCase(addingAdRepository: sl()));
  sl.registerLazySingleton(() => SubCategoryUseCase(addingAdRepository: sl()));
  sl.registerLazySingleton(() => CitiesUseCase(addingAdRepository: sl()));
  sl.registerLazySingleton(() => AreaUseCase(addingAdRepository: sl()));
  sl.registerLazySingleton(() => FeatureUseCase(addingAdRepository: sl()));
  sl.registerLazySingleton(
      () => FeatureOptionUseCase(addingAdRepository: sl()));
  sl.registerLazySingleton(() => AddingAdUseCase(addingAdRepository: sl()));
  // Repository
  sl.registerLazySingleton<AddingAdRepository>(
      () => AddingAdRepositoryIMP(adRemoteDataSource: sl()));
  // data source
  sl.registerLazySingleton<AddingAdRemoteDataSource>(
      () => AddingAdRemoteDataSourceIMP());

  ///===========================================================================
  ///===========================================================================
  /// My ads
  // provider
  sl.registerFactory(() => MyActiveAdsProvider(myAdsGetActiveAdsUseCase: sl()));
  sl.registerFactory(() => DeletingAdProvider(deleteMyAdUseCase: sl()));
  //use cases
  sl.registerLazySingleton(
      () => MyAdsGetActiveAdsUseCase(myAdsRepository: sl()));

  sl.registerLazySingleton(() => DeleteMyAdUseCase(myAdsRepository: sl()));
  // repository
  sl.registerLazySingleton<MyAdsRepository>(
      () => MyAdsRepositoryIMP(myAdsRemoteDataSource: sl()));
  // data source
  sl.registerLazySingleton<MyAdsRemoteDataSource>(
      () => MyAdsRemoteDataSourcseIMP());

  ///===========================================================================
  ///===========================================================================
  ///user data
  // provider
  sl.registerFactory(
      () => GetCurrentUserDataProvider(getCurrentUserDataUseCase: sl()));

  sl.registerFactory(
      () => UpdateCurrentUserProvider(updateCurrentUserUseCase: sl()));
  sl.registerFactory(() => FollowMehodProvider(followMethodUseCase: sl()));
  sl.registerFactory(
      () => GetFollowingUsersProvider(followingUsersUseCase: sl()));
  sl.registerFactory(
      () => GetFollowersUsersProvider(followersUsersUseCase: sl()));
  // use case
  sl.registerLazySingleton(
      () => GetCurrentUserDataUseCase(userRepository: sl()));
  sl.registerLazySingleton(
      () => UpdateCurrentUserUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => FollowMethodUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => FollowingUsersUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => FollowersUsersUseCase(userRepository: sl()));

  // repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryIMP(userRemoteDataSource: sl()));
  // data source
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceIMp());

  ///===========================================================================
  ///===========================================================================
  ///Favorite ads
  // provider
  sl.registerFactory(() => FavoriteAdProvider(getAllFavoriteAdUseCase: sl()));
  sl.registerLazySingleton(() =>
      AddingAdToFavoriteAdListProvider(addingAdToFavoriteAdListUseCase: sl()));
  sl.registerLazySingleton(() => DeletingAdFromFavoriteAdListProvider(
      deleteAdFromFavoriteAdListUseCase: sl()));
  //use case
  sl.registerLazySingleton(
      () => GetAllFavoriteAdUseCase(favoriteAdRepository: sl()));
  sl.registerLazySingleton(
      () => AddingAdToFavoriteAdListUseCase(favoriteAdRepository: sl()));
  sl.registerLazySingleton(
      () => DeleteAdFromFavoriteAdListUseCase(favoriteAdRepository: sl()));

  // repository
  sl.registerLazySingleton<FavoriteAdRepository>(
      () => FavoriteAdRepositoryIMP(favoriteAdRemoteDataSource: sl()));
  // data source
  sl.registerLazySingleton<FavoriteAdRemoteDataSource>(
      () => FavoriteAdReomteDataSourceIMP());

  ///===========================================================================
  ///===========================================================================
  ///Specific ad
  // provider
  sl.registerFactory(() =>
      TellMeWhenPriceDecreaseProvider(tellMeWhenPriceDecreaseUseCase: sl()));
  sl.registerFactory(() => ReportAdProvider(reportAdUseCase: sl()));
  sl.registerFactory(() => SendCommentProvider(sendCommentUseCase: sl()));
  sl.registerFactory(() => GetAllCommentsProvider(getAllCommentsUseCase: sl()));
  sl.registerFactory(() => ReportCommentsProvider(reportCommentUseCase: sl()));
  sl.registerFactory(
      () => SendReplyCommentProvider(sendReplyCommentUseCase: sl()));
  //use case
  sl.registerLazySingleton(
      () => TellMeWhenPriceDecreaseUseCase(specificAdRepository: sl()));
  sl.registerLazySingleton(() => ReportAdUseCase(specificAdRepository: sl()));
  sl.registerLazySingleton(
      () => SendCommentUseCase(specificAdRepository: sl()));
  sl.registerLazySingleton(
      () => GetAllCommentsUseCase(specificAdRepository: sl()));
  sl.registerLazySingleton(
      () => ReportCommentUseCase(specificAdRepository: sl()));
  sl.registerLazySingleton(
      () => SendReplyCommentUseCase(specificAdRepository: sl()));
  // repository
  sl.registerLazySingleton<SpecificAdRepository>(
      () => SpecificAdRepositoryIMP(specificAdRemoteDataSource: sl()));
  // data source
  sl.registerLazySingleton<SpecificAdRemoteDataSource>(
      () => SpecificAdRemoteDataSourceIMP());
}
