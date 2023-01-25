// ignore_for_file: unused_field, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/networking/api%20error/error%20403/403_error.dart';
import 'package:sheraa/networking/api%20error/server%20error/server_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/urls.dart';
import 'package:http/http.dart' as http;

class ChooseCountryInMoreScreen extends StatefulWidget {
  const ChooseCountryInMoreScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCountryInMoreScreen> createState() =>
      _ChooseCountryInMoreScreenState();
}

class _ChooseCountryInMoreScreenState extends State<ChooseCountryInMoreScreen> {
  double? _height;
  double? _width;

  bool _isLoading = false;

  late ScrollController _controller;

  List<dynamic> _allCountries = [];

  int _page = 1;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  int showItem = 0;
  int? showBottom;
  String countryUmageUrl = "";

  void _getAllCountries() async {
    final homeServerError =
        Provider.of<HomeServerError>(context, listen: false);

    final erro403 = Provider.of<Error403>(context, listen: false);

    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
        Uri.parse(
          "${Urls.COUNTRIES_URL}?$_page",
        ),
        headers: <String, String>{
          'Accept': 'application/json',
          "Accept-Language": UserData.getUSerLang(),
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);

        _allCountries = map["data"];
        print(_allCountries);
      });
    } else if (response.statusCode == 422) {
      Navigator.of(context).popUntil((route) => route.isFirst);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: mainAppColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: BigText(
                color: blackColor,
                text: AppLocalizations.of(context)!
                    .translate("There is an internet connection error"),
                typeOfFontWieght: 1,
              ),
            );
          });
      setState(() {
        _isLoading = false;
      });
    } else if (response.statusCode == 403) {
      Navigator.of(context).popUntil((route) => route.isFirst);

      print(response.statusCode);
      setState(() {
        erro403.error403(context, response.statusCode);
        _isLoading = false;
      });
    } else {
      print(response.statusCode);
      print(response.body);
      setState(() {
        homeServerError.serverError(context, response.statusCode);
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _loadMore() async {
    final homeServerError =
        Provider.of<HomeServerError>(context, listen: false);

    final erro403 = Provider.of<Error403>(context, listen: false);

    if (_hasNextPage == true &&
        _isLoading == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 50) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1

      final response = await http.get(
          Uri.parse(
            "${Urls.COUNTRIES_URL}?$_page",
          ),
          headers: <String, String>{
            'Accept': 'application/json',
            "Accept-Language": UserData.getUSerLang(),
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        if (map.isNotEmpty) {
          setState(() {
            List<dynamic> data = map["data"];
            _allCountries.addAll(data);
          });
        } else {
          setState(() {
            _hasNextPage = false;
            _isLoadMoreRunning = false;
          });
        }
      } else if (response.statusCode == 422) {
        Navigator.of(context).popUntil((route) => route.isFirst);

        print("object422");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: mainAppColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                title: BigText(
                  color: blackColor,
                  text: AppLocalizations.of(context)!
                      .translate("There is an internet connection error"),
                  typeOfFontWieght: 1,
                ),
              );
            });
        setState(() {
          _isLoadMoreRunning = false;
        });
      } else if (response.statusCode == 403) {
        print("object403");
        Navigator.of(context).popUntil((route) => route.isFirst);

        print(response.statusCode);
        setState(() {
          erro403.error403(context, response.statusCode);
          _isLoadMoreRunning = false;
        });
      } else {
        print("666666666666666666666666666666666666666666666");
        print(response.statusCode);
        print(response.body);
        setState(() {
          homeServerError.serverError(context, response.statusCode);
          _isLoadMoreRunning = false;
        });
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getAllCountries();

    _controller = ScrollController()..addListener(_loadMore);
    showItem = UserData.getCountryId()!;
    showBottom = showItem;
    countryUmageUrl = UserData.getCountryImageUrl()!;
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
                text: AppLocalizations.of(context)!.translate("Country")),
          ),
          body: _isLoading
              ? Center(
                  child: SpinKitFadingCircle(color: mainAppColor),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: _height! / 81.2, //10
                    ),
                    Divider(
                      thickness: 1,
                      height: 0,
                      color: containerColor,
                    ),
                    SizedBox(
                      height: _height! / 162.4, //5
                    ),
                    Expanded(
                      child: buildList(_width!, _height!),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: _height! / 40.6),
                      child: CustomButton(
                        enableVerticalMargin: false,
                        enableHorizontalMargin: false,
                        horizontalMargin: _width! / 12.5, //30
                        width: _width! / 1.19047619047619, //315
                        height: _height! / 18.04444444444444, //45
                        btnLbl:
                            AppLocalizations.of(context)!.translate("confirm"),
                        onPressedFunction: () {
                          setState(() {
                            UserData.setCountryId(showItem);
                            UserData.setCountryImageUrl(countryUmageUrl);
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigation()),
                              (route) => false).then((value) {
                            setState(() {});
                          });
                        },
                        btnColor: showBottom == showItem
                            ? Color(0xFF9EA9A8)
                            : whiteColor,
                        btnStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: showBottom == showItem
                                ? whiteColor
                                : mainAppColor,
                            fontSize: _height! / 67.66666666666667),
                        borderColor: showBottom == showItem
                            ? Color(0xFF9EA9A8)
                            : mainAppColor,
                      ),
                    ),
                    if (_isLoadMoreRunning == true)
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 25),
                        child: Center(
                          child: SpinKitFadingCircle(color: mainAppColor),
                        ),
                      ),

                    // When nothing else to load
                    if (_hasNextPage == false)
                      Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 40),
                        color: Colors.amber,
                        child: const Center(
                          child: Text('You have fetched all of the content'),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildList(double _width, double _height) {
    return ListView.separated(
        controller: _controller,
        itemCount: _allCountries.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
            indent: _width / 20.83333333333333, //18
            endIndent: _width / 20.83333333333333, //18
          );
        },
        itemBuilder: (context, index) {
          return listViewBody(index, _width, _height);
        });
  }

  Widget listViewBody(int index, double _width, double _height) {
    return InkWell(
      onTap: () {
        setState(() {
          showItem = _allCountries[index]["id"];
          countryUmageUrl = _allCountries[index]["image"];
          print("===========================");
          print(showItem);
          print(countryUmageUrl);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _height / 62.46153846153846, //13
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _width / 20.83333333333333),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: _allCountries[index]["text"] ?? "",
                  size: _height / 58, //14
                  color: blackColor,
                  typeOfFontWieght:
                      showItem == _allCountries[index]["id"] ? 1 : 0,
                ),
                Visibility(
                  visible:
                      showItem == _allCountries[index]["id"] ? true : false,
                  child: Image.asset(
                    "assets/images/checkbox.png",
                    color: mainAppColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _height / 62.46153846153846, //13
          ),
        ],
      ),
    );
  }
}
