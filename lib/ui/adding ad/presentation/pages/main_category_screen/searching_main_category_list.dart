import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/ui/adding%20ad/presentation/controller/main_category_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class SearchingMainCategoryList extends StatefulWidget {
  final bool chooseDepartmentFilter;
  const SearchingMainCategoryList({
    Key? key,
    required this.chooseDepartmentFilter,
  }) : super(key: key);

  @override
  State<SearchingMainCategoryList> createState() =>
      _SearchingMainCategoryListState();
}

class _SearchingMainCategoryListState extends State<SearchingMainCategoryList> {
  MainCategoryProvider? _mainCategoryProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  bool _isSearchingLoading = false;

  Future searchingPagenationApi() async {
    _isSearchingLoading = true;

    setState(() {});

    await MainCategoryController.searchingPagenationApi(
        context, _pageNumber, true, _mainCategoryProvider!.searchingText);

    _pageNumber += 1;

    _isSearchingLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        searchingPagenationApi();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mainCategoryProvider =
        Provider.of<MainCategoryProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: controller,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
                endIndent: 20,
                indent: 20,
              );
            },
            itemCount: _mainCategoryProvider!.searchingMainCategoryList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    MainCategoryController.onTapOnCategoryAction(
                        context,
                        _mainCategoryProvider!.mainCategoryList[index].name,
                        _mainCategoryProvider!.mainCategoryList[index].id,
                        widget.chooseDepartmentFilter);
                  });
                },
                child: CategoryWidget(
                  pageName: "main category",
                  categoryName: _mainCategoryProvider!
                      .searchingMainCategoryList[index].name,
                  categoryId: _mainCategoryProvider!
                      .searchingMainCategoryList[index].id,
                ),
              );
            },
          ),
        ),
        _isSearchingLoading
            ? Center(child: SpinKitFadingCircle(color: mainAppColor))
            : Container()
      ],
    );
  }
}
