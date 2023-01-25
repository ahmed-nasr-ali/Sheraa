import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/custom_container/custom_container.dart';
import 'package:sheraa/custom_widgets/no_data/no_data.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/country.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/providers/countries_provider.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/error.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  _ChooseCountryScreenState createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  double? _height, _width;

  bool _isSelected = false;
  int? selectedIndex;
  AuthProvider? _authProvider;
  Future<List<Country>>? _countries;
  bool initialRun = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (initialRun) {
      _authProvider = Provider.of<AuthProvider>(context);

      _countries = Provider.of<CountriesProvider>(context, listen: false)
          .getCountriesList(context);

      initialRun = false;
    }
  }

  Widget buildBodyContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/map.png',
          // fit: BoxFit.cover,
          height: 200,
          //width: 400,
        ),
        Text(
          AppLocalizations.of(context)!.translate(
            "choose_country",
          ),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: FutureBuilder<List<Country>>(
            future: _countries,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: SpinKitPulse(color: mainAppColor),
                  );
                case ConnectionState.active:
                  return Text('');
                case ConnectionState.waiting:
                  return Center(
                    child: SpinKitFadingCircle(color: mainAppColor),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Error(
                      errorMessage:
                          AppLocalizations.of(context)!.translate('error'),
                      onRetryPressed: () {},
                    );
                  else {
                    if (snapshot.data!.length > 0)
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              selectedColor: selectedIndex == index
                                  ? mainAppColor
                                  : accentColor,
                              width: _width! * 0.1,
                              height: _height! * .075,
                              hasHorizontalMargin: true,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    print("selected is: $selectedIndex");
                                  });
                                  // _authProvider!.setCurrentCountry('ksa');
                                  Country country = snapshot.data![index];
                                  SharedPreferencesHelper.save(
                                      "country", country);
                                  UserData.setCountryId(
                                      snapshot.data![index].id);
                                  UserData.setCountryImageUrl(
                                      snapshot.data![index].image);
                                  _authProvider!.setCurrentCountry(country);
                                  Navigator.pushNamed(
                                      context, '/select_gender');

                                  print(
                                      "=====================================");
                                  print(UserData.getCountryId());
                                  print(UserData.getCountryImageUrl());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    //  Image.asset('assets/images/saudi-arabia.png'),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        snapshot.data![index].image,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(snapshot.data![index].text)
                                  ],
                                ),
                              ),
                            );
                          });
                    else
                      return Center(
                        child: NoData(
                            message: AppLocalizations.of(context)!
                                .translate('no_results')),
                      );
                  }
              }
              return Center(
                child: SpinKitFadingCircle(color: mainAppColor),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return PageContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: buildBodyContent(),
      ),
    );
  }
}
