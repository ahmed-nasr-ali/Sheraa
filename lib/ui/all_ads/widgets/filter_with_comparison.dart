import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class FilterWithMoreSelected extends StatefulWidget {
  const FilterWithMoreSelected({Key? key}) : super(key: key);

  @override
  State<FilterWithMoreSelected> createState() => _FilterWithMoreSelectedState();
}

class _FilterWithMoreSelectedState extends State<FilterWithMoreSelected> {
  double _width = 0, _height = 0;
  AdsProvider? _adsProvider;
  bool _initialRun = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _adsProvider = Provider.of<AdsProvider>(context);

      _initialRun = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: _width * 0.02, vertical: _height * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _adsProvider!.setAdsLatest();
                  },
                  child: Container(
                    height: _height * 0.07,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: _adsProvider!.adsTheLatestSelected
                            ? mainAppColor
                            : secondryMainColor),
                    child: Center(
                      child: Text(
                        "الاحدث",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: _adsProvider!.adsTheLatestSelected
                                ? whiteColor
                                : textGrayColor),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _adsProvider!.setAdsNearest();
                  },
                  child: Container(
                    height: _height * 0.07,
                    margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: _adsProvider!.adsTheNearestSelected
                            ? mainAppColor
                            : secondryMainColor),
                    child: Center(
                      child: Text(
                        "بالقرب من موقعي",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: _adsProvider!.adsTheNearestSelected
                                ? whiteColor
                                : textGrayColor),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _adsProvider!.setAdsLowerPriceSelected();
                  },
                  child: Container(
                    height: _height * 0.07,
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: _adsProvider!.adsTheLowerPriceSelected
                            ? mainAppColor
                            : secondryMainColor),
                    child: Center(
                      child: Text(
                        "الأقل سعرا",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: _adsProvider!.adsTheLowerPriceSelected
                                ? whiteColor
                                : textGrayColor),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _adsProvider!.setAdsMostPriceSelected();
                  },
                  child: Container(
                    height: _height * 0.07,
                    margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.02),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: _adsProvider!.adsTheMostPriceSelected
                            ? mainAppColor
                            : secondryMainColor),
                    child: Center(
                      child: Text(
                        "الأكثر سعرا",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: _adsProvider!.adsTheMostPriceSelected
                                ? whiteColor
                                : textGrayColor),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
