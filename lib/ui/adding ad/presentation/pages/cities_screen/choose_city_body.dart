import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/cities_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/cities_screen/list_of_cities_ui.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/cities_screen/searching_cities_list.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_cities_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class ChooseCityBody extends StatefulWidget {
  final bool fromFilter;

  const ChooseCityBody({
    Key? key,
    required this.fromFilter,
  }) : super(key: key);

  @override
  State<ChooseCityBody> createState() => _ChooseCityBodyState();
}

class _ChooseCityBodyState extends State<ChooseCityBody> {
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
                child: ListOfCitiesUi(
                fromFilter: widget.fromFilter,
              ))
            : isSearchingLoading
                ? Center(
                    child: SpinKitFadingCircle(color: mainAppColor),
                  )
                : Expanded(
                    child: SearchingCitiesList(fromFilter: widget.fromFilter))
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
                  Provider.of<AddingAdCitiesProvider>(context, listen: false)
                      .setSearchingText(value);
                  setState(() {
                    isSearchingLoading = true;
                  });
                  await AddingAdCitiesController.fetchData(
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
