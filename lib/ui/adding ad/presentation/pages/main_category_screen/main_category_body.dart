import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/main_category_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/main_category_screen/list_of_main_category_ui.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/main_category_screen/searching_main_category_list.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class MainCategoryBody extends StatefulWidget {
  final bool chooseDepartmentFilter;
  const MainCategoryBody({
    Key? key,
    required this.chooseDepartmentFilter,
  }) : super(key: key);

  @override
  State<MainCategoryBody> createState() => _MainCategoryBodyState();
}

class _MainCategoryBodyState extends State<MainCategoryBody> {
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
                child: ListOfMainCategoryUi(
                  chooseDepartmentFilter: widget.chooseDepartmentFilter,
                ),
              )
            : isSearchingLoading
                ? Center(
                    child: SpinKitFadingCircle(color: mainAppColor),
                  )
                : Expanded(
                    child: SearchingMainCategoryList(
                      chooseDepartmentFilter: widget.chooseDepartmentFilter,
                    ),
                  )
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
                  Provider.of<MainCategoryProvider>(context, listen: false)
                      .setSearchingText(value);
                  setState(() {
                    isSearchingLoading = true;
                  });
                  await MainCategoryController.fetchData(
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
