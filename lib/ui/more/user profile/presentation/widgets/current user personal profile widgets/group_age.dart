// ignore_for_file: must_be_immutable, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/age.dart';
import 'package:sheraa/providers/countries_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/update_current_user_data.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/error.dart';

class GroupAge extends StatefulWidget {
  GroupAge({Key? key}) : super(key: key);

  @override
  State<GroupAge> createState() => _GroupAgeState();
}

class _GroupAgeState extends State<GroupAge> {
  Future<List<Age>>? _agesGroup;

  bool _isLoading = true;

  double? _height;

  double? _width;

  int ageSelect = 0;

  @override
  void initState() {
    super.initState();

    ageSelect = UserData.getAgeId() ?? 0;
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isLoading) {
      _agesGroup = Provider.of<CountriesProvider>(context, listen: false)
          .getAgesList(context);

      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<UpdateCurrentUserProvider>(context, listen: false);

    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return FutureBuilder<List<Age>>(
        future: _agesGroup,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: SpinKitPulse(color: mainAppColor),
              );

            case ConnectionState.active:
              return Text("");

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
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width! / 23.4375, //16
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ageSelect = snapshot.data![index].id ?? 0;
                              });
                              authProvider.setUsergroupAgeId(
                                  snapshot.data![index].id ?? 0);
                            },
                            child: Row(
                              children: [
                                ageSelect == snapshot.data![index].id
                                    ? Image.asset(
                                        "assets/images/checkboxcirclefill.png")
                                    : Image.asset("assets/images/checkbox.png"),
                                SizedBox(
                                  width: _width! / 75,
                                ),
                                SmallText(
                                  typeOfFontWieght:
                                      ageSelect == snapshot.data![index].id
                                          ? 1
                                          : 0,
                                  text: snapshot.data![index].groupName ?? "",
                                  size: _height! / 58,
                                  color: ageSelect == snapshot.data![index].id
                                      ? blackColor
                                      : textGrayColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _height! / 54.13333333333333,
                          )
                        ],
                      ),
                    );
                  },
                );
              }
          }
        });
  }
}
