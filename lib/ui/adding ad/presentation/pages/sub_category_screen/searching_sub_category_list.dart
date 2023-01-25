// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/ui/adding%20ad/presentation/controller/sub_category_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';

class SearchingSubCategoryList extends StatefulWidget {
  final bool chooseDepartmentFilter;
  int mainCategoryId;
  SearchingSubCategoryList({
    Key? key,
    required this.chooseDepartmentFilter,
    required this.mainCategoryId,
  }) : super(key: key);

  @override
  State<SearchingSubCategoryList> createState() =>
      _SearchingSubCategoryListState();
}

class _SearchingSubCategoryListState extends State<SearchingSubCategoryList> {
  SubCategoryProvider? _subCategoryProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  bool _isSearchingLoading = false;

  Future searchingPagenationApi() async {
    _isSearchingLoading = true;

    setState(() {});

    await SubCategoryController.searchingPagenationApi(widget.mainCategoryId,
        context, _pageNumber, true, _subCategoryProvider!.searchingText);

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
    _subCategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);
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
            itemCount: _subCategoryProvider!.searchingSubCategoryList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    SubCategoryController.onTapOnCategoryAction(
                      context,
                      _subCategoryProvider!.subCategoryList[index].name,
                      _subCategoryProvider!.subCategoryList[index].id,
                      widget.chooseDepartmentFilter,
                    );
                  });
                },
                child: CategoryWidget(
                  pageName: "sub category",
                  categoryName: _subCategoryProvider!
                      .searchingSubCategoryList[index].name,
                  categoryId:
                      _subCategoryProvider!.searchingSubCategoryList[index].id,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
