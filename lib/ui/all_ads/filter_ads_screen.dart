import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/ad/choose_area_for_ads.dart';
import 'package:sheraa/ui/ad/choose_country_for_ads.dart';
import 'package:sheraa/ui/ad/main_department.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/area_screen/choose_area_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/cities_screen/choose_citiy_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/main_category_screen/main_category_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/ui/all_ads/widgets/filter_other_options.dart';
import 'package:sheraa/ui/all_ads/widgets/filter_with_comparison.dart';
import 'package:sheraa/ui/all_ads/widgets/filter_with_price.dart';
import 'package:sheraa/ui/more/widgets/more_item.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/commons.dart';

class FilterAdsScreen extends StatefulWidget {
  const FilterAdsScreen({Key? key}) : super(key: key);

  @override
  State<FilterAdsScreen> createState() => _FilterAdsScreenState();
}

class _FilterAdsScreenState extends State<FilterAdsScreen> {
  double _width = 0, _height = 0;
  bool _initialRun = true;
  AdsProvider? _adsProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _adsProvider = Provider.of<AdsProvider>(context);

      _initialRun = false;
    }
  }

  Widget filterAdsBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            thickness: 1,
            color: containerColor,
          ),
          InkWell(
            onTap: () {
              if (_adsProvider!.cityName.length == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChooseCitiesScreen(fromFilter: true)
                        // ChooseCountryForAds(
                        //       fromFilter: true,
                        //     ),

                        ));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: _width * 0.05, vertical: 8),
                      child: Text(
                        "المدينة",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _adsProvider!.cityName.length != 0
                          ? _adsProvider!.cityName
                          : "جميع المدن",
                      style: TextStyle(color: textGrayColor, fontSize: 14),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: _width * 0.03),
                      child: Image.asset(
                        'assets/images/arrow_simple.png',
                        color: secondGrayColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: containerColor,
          ),
          InkWell(
            onTap: () {
              if (_adsProvider!.cityName.length == 0) {
                Commons.showError(
                    context: context, message: "يجب عليك اختيار المدينه اولا");
              } else {
                if (_adsProvider!.areaName.length == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChooseAreaScreen(fromFilter: true)
                          //  ChooseAreaForAds(
                          //       chooseAreaFromFilter: true,
                          //     )
                          ));
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: _width * 0.05, vertical: 5),
                      child: Text(
                        "المنطقة / الحي",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _adsProvider!.areaName.length != 0
                          ? _adsProvider!.areaName
                          : "جميع المناطق",
                      style: TextStyle(color: textGrayColor, fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: _width * 0.03,
                      ),
                      child: Image.asset(
                        'assets/images/arrow_simple.png',
                        color: secondGrayColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: containerColor,
          ),
          InkWell(
            onTap: () {
              if (_adsProvider!.departmentName.length == 0) {
                UserData.setMainCategoryId(0);
                UserData.setMainCategoryName("");

                Provider.of<MainCategoryProvider>(context, listen: false)
                    .setAllDateToDefault();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainCategoryScreen(
                              chooseDepartmentFilter: true,
                            )));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: _width * 0.05, vertical: 5),
                      child: Text(
                        "القسم",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _adsProvider!.departmentName.length != 0
                          ? _adsProvider!.departmentName
                          : "جميع الأقسام",
                      style: TextStyle(color: textGrayColor, fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: _width * 0.01,
                      ),
                      child: Image.asset(
                        'assets/images/arrow_simple.png',
                        color: secondGrayColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: containerColor,
          ),
          FilterWithPrice(),
          Divider(
            thickness: 5,
            color: secondryMainColor,
          ),
          FilterWithMoreSelected(),
          Divider(
            thickness: 3,
            color: secondryMainColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                  child: Text(
                    AppLocalizations.of(context)!.translate("other_options"),
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          FilterOtherOptions(),
          Row(
            children: [
              CustomButton(
                width: _width * 0.38,
                borderColor: mainAppColor,
                btnColor: whiteColor,
                btnLbl: 'تفريغ الحقول',
                onPressedFunction: () {
                  _adsProvider!.setCityId(0);
                  _adsProvider!.setCityName('');
                  _adsProvider!.setDepartmentId(0);
                  _adsProvider!.setDepartmentName('');
                  _adsProvider!.theMostPriceSelected = false;
                  print("ok");
                },
                btnStyle: TextStyle(fontSize: 14, color: mainAppColor),
              ),
              CustomButton(
                width: _width * 0.42,
                borderColor: mainAppColor,
                btnColor: mainAppColor,
                btnLbl: 'فلترة النتائج (2,658)',
                onPressedFunction: () {
                  print("ok");
                },
                btnStyle: TextStyle(fontSize: 14, color: whiteColor),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
          appBar: CustomAppbar(
              hasCenterLogo: false,
              title: AppLocalizations.of(context)!.translate('filter'),
              trailingWidget: Container(
                margin: EdgeInsets.symmetric(horizontal: _width * 0.01),
                child: GestureDetector(
                  onTap: () {
                    print("done");
                  },
                  child: Text(AppLocalizations.of(context)!.translate('done')),
                ),
              ),
              hasBackBtn: true,
              backButtonAction: () => Navigator.pop(context)),
          body: filterAdsBody()
          //adsBody(),
          ),
    ));
  }
}
