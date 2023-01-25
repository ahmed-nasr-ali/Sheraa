import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/ui/adding%20ad/presentation/controller/main_category_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class ListOfMainCategoryUi extends StatefulWidget {
  final bool chooseDepartmentFilter;
  const ListOfMainCategoryUi({
    Key? key,
    required this.chooseDepartmentFilter,
  }) : super(key: key);

  @override
  State<ListOfMainCategoryUi> createState() => _ListOfMainCategoryUiState();
}

class _ListOfMainCategoryUiState extends State<ListOfMainCategoryUi> {
  MainCategoryProvider? _mainCategoryProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  double? _width;

  Future fetch() async {
    await MainCategoryController.fetchData(context, 1, false, "");

    setState(() {});
  }

  Future pagenationApi() async {
    await MainCategoryController.pagenationApi(context, _pageNumber, false, "");

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
    _width = MediaQuery.of(context).size.width;

    return _mainCategoryProvider!.isLoading
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
                itemCount: _mainCategoryProvider!.mainCategoryList.length + 1,
                itemBuilder: (context, index) {
                  if (index < _mainCategoryProvider!.mainCategoryList.length) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          MainCategoryController.onTapOnCategoryAction(
                              context,
                              _mainCategoryProvider!
                                  .mainCategoryList[index].name,
                              _mainCategoryProvider!.mainCategoryList[index].id,
                              widget.chooseDepartmentFilter);
                        });
                      },
                      child: CategoryWidget(
                        pageName: "main category",
                        categoryName:
                            _mainCategoryProvider!.mainCategoryList[index].name,
                        categoryId:
                            _mainCategoryProvider!.mainCategoryList[index].id,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Center(
                        child: _mainCategoryProvider!.loadingpagenationApi
                            ? SpinKitFadingCircle(color: mainAppColor)
                            : Container(),
                      ),
                    );
                  }
                },
              ))
            ],
          );
  }
}
