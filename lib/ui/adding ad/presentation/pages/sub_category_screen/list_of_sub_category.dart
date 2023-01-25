// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/ui/adding%20ad/presentation/controller/sub_category_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class ListOfSubCategoryUi extends StatefulWidget {
  bool chooseSubDepartmentFilter;
  int mainCategoryId;
  ListOfSubCategoryUi({
    Key? key,
    required this.chooseSubDepartmentFilter,
    required this.mainCategoryId,
  }) : super(key: key);

  @override
  State<ListOfSubCategoryUi> createState() => _ListOfSubCategoryUiState();
}

class _ListOfSubCategoryUiState extends State<ListOfSubCategoryUi> {
  SubCategoryProvider? _subCategoryProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  double? _width;

  Future fetch() async {
    await SubCategoryController.fetchData(
        widget.mainCategoryId, context, 1, false, "");

    setState(() {});
  }

  Future pagenationApi() async {
    await SubCategoryController.pagenationApi(
        widget.mainCategoryId, context, _pageNumber, false, "");

    _pageNumber += 1;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetch();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        pagenationApi();
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
    _width = MediaQuery.of(context).size.width;

    return _subCategoryProvider!.isLoading
        ? Center(
            child: SpinKitFadingCircle(color: mainAppColor),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.separated(
                    controller: controller,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        endIndent: _width! / 18.75,
                        indent: _width! / 18.75,
                        color: containerColor,
                      );
                    },
                    itemCount: _subCategoryProvider!.subCategoryList.length + 1,
                    itemBuilder: (context, index) {
                      if (index <
                          _subCategoryProvider!.subCategoryList.length) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              SubCategoryController.onTapOnCategoryAction(
                                context,
                                _subCategoryProvider!
                                    .subCategoryList[index].name,
                                _subCategoryProvider!.subCategoryList[index].id,
                                widget.chooseSubDepartmentFilter,
                              );
                            });
                          },
                          child: CategoryWidget(
                            pageName: "sub category",
                            categoryName: _subCategoryProvider!
                                .subCategoryList[index].name,
                            categoryId:
                                _subCategoryProvider!.subCategoryList[index].id,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Center(
                            child: _subCategoryProvider!.loadingpagenationApi
                                ? SpinKitFadingCircle(color: mainAppColor)
                                : Container(),
                          ),
                        );
                      }
                    }),
              ),
            ],
          );
  }
}
