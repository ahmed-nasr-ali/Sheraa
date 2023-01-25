import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';

import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/sub_category_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/sub_category_screen/list_of_sub_category.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/sub_category_screen/searching_sub_category_list.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class SubCategoryBody extends StatefulWidget {
  final bool chooseSubDepartmentFilter;
  final int mainCategoryId;

  const SubCategoryBody({
    Key? key,
    required this.chooseSubDepartmentFilter,
    required this.mainCategoryId,
  }) : super(key: key);

  @override
  State<SubCategoryBody> createState() => _SubCategoryBodyState();
}

class _SubCategoryBodyState extends State<SubCategoryBody> {
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
                child: ListOfSubCategoryUi(
                    chooseSubDepartmentFilter: widget.chooseSubDepartmentFilter,
                    mainCategoryId: widget.mainCategoryId))
            : isSearchingLoading
                ? Center(
                    child: SpinKitFadingCircle(color: mainAppColor),
                  )
                : Expanded(
                    child: SearchingSubCategoryList(
                    chooseDepartmentFilter: widget.chooseSubDepartmentFilter,
                    mainCategoryId: widget.mainCategoryId,
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
                  Provider.of<SubCategoryProvider>(context, listen: false)
                      .setSearchingText(value);
                  setState(() {
                    isSearchingLoading = true;
                  });
                  await SubCategoryController.fetchData(
                      widget.mainCategoryId, context, 1, true, value);

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
