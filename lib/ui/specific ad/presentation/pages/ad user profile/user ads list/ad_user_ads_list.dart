// ignore_for_file: unused_field, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/providers/get%20specific%20ad/get_specific_ad_provider.dart';
import 'package:sheraa/ui/more/my%20ads/widgets/my_ad_body.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdUserAdsList extends StatefulWidget {
  int userId;
  String userName;
  AdUserAdsList({
    Key? key,
    required this.userId,
    required this.userName,
  }) : super(key: key);

  @override
  State<AdUserAdsList> createState() => _AdUserAdsListState();
}

class _AdUserAdsListState extends State<AdUserAdsList> {
  double? _height;

  double? _width;

  bool isLoading = true;

  List<Ad> _userAdsList = [];

  getDataMethod() async {
    bool x = true;
    x = await Provider.of<GetSpecificAdAndUserAdsProvider>(context,
            listen: false)
        .getUserAdsList(
      context,
      widget.userId,
    );

    if (!x) {
      setState(() {
        _userAdsList =
            Provider.of<GetSpecificAdAndUserAdsProvider>(context, listen: false)
                .userAdsList;
        isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getDataMethod();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("assets/images/arrow_simple_chock.png")),
            title: SmallText(
              color: blackColor,
              size: _height! / 50.75, //16
              typeOfFontWieght: 1,
              text:
                  "${AppLocalizations.of(context)!.translate("Ads")} ${widget.userName}",
            ),
          ),
          body: isLoading
              ? SpinKitFadingCircle(color: mainAppColor)
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      thickness: _height! / 135.3333333333333, //10
                      color: secondryMainColor,
                    );
                  },
                  itemCount: _userAdsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => SpecificAdScreenDetails(
                        //       pageName:
                        //           "notmoreInformation", //moreInformation (second case)
                        //       isMyAd: false,
                        //       adDetails: _userAdsList[index],
                        //       navigateToAdUserProfile: true,
                        //     ),
                        //   ),
                        // );
                      },
                      child: MyAdBody(
                        isHeartAppear: false,
                        isFavorteAd: true,
                        adDetails: _userAdsList[index],
                        isEffectiveAd: true,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
