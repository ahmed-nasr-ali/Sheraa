// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/area_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/area_screen/list_of_areas_ui.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/area_screen/searching_area_list.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_area_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class ChooseAreaBody extends StatefulWidget {
  final bool chooseCityFromFilter;
  const ChooseAreaBody({
    Key? key,
    required this.chooseCityFromFilter,
  }) : super(key: key);

  @override
  State<ChooseAreaBody> createState() => _ChooseAreaBodyState();
}

class _ChooseAreaBodyState extends State<ChooseAreaBody> {
  TextEditingController _searchingController = TextEditingController();

  bool isSearchingLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 25 //15
              ),
          child: searchingBar(context),
        ),
        _searchingController.text.isEmpty
            ? Expanded(
                child: ListOfAreasUi(
                chooseCityFromFilter: widget.chooseCityFromFilter,
              ))
            : isSearchingLoading
                ? Center(
                    child: SpinKitFadingCircle(color: mainAppColor),
                  )
                : Expanded(
                    child: SearchingAreaList(
                    chooseCityFromFilter: widget.chooseCityFromFilter,
                  ))
      ],
    );
  }

  Widget searchingBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondryMainColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / 81.2), //15
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 37.5, //10
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              controller: _searchingController,
              cursorColor: blackColor,
              style: TextStyle(color: blackColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 37.5,
                ),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: AppLocalizations.of(context)!
                    .translate("searching in categories"),
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 64.33, //12
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFBFBFBF),
                ),
              ),
              onChanged: (value) async {
                if (value.isEmpty) {}
                if (value.isNotEmpty) {
                  Provider.of<AddingAdAreaProvider>(context, listen: false)
                      .setSearchingText(value);

                  setState(() {
                    isSearchingLoading = true;
                  });
                  await AddingAdAreaController.fetchData(
                      context, 1, true, value);

                  isSearchingLoading = false;
                }
                setState(() {});
              },
              onTap: () {},
            ),
          ),
          Image.asset(
            "assets/images/search.png",
            color: Color(0xFFBFBFBF),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 25 //15
              ),
        ],
      ),
    );
  }
}
