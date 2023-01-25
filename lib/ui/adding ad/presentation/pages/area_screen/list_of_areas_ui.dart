import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/area_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_area_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class ListOfAreasUi extends StatefulWidget {
  final bool chooseCityFromFilter;

  const ListOfAreasUi({
    Key? key,
    required this.chooseCityFromFilter,
  }) : super(key: key);

  @override
  State<ListOfAreasUi> createState() => _ListOfAreasUiState();
}

class _ListOfAreasUiState extends State<ListOfAreasUi> {
  AddingAdAreaProvider? _areaProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  double? _width;

  Future fetch() async {
    await AddingAdAreaController.fetchData(context, 1, false, "");

    setState(() {});
  }

  Future pagenationApi() async {
    await AddingAdAreaController.pagenationApi(context, _pageNumber, false, "");

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

    _areaProvider = Provider.of<AddingAdAreaProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return _areaProvider!.isLoading
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
                  itemCount: _areaProvider!.areasList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < _areaProvider!.areasList.length) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            AddingAdAreaController.onTapOnCategoryAction(
                              context,
                              _areaProvider!.areasList[index].text,
                              _areaProvider!.areasList[index].id,
                              widget.chooseCityFromFilter,
                            );
                          });
                        },
                        child: CategoryWidget(
                          pageName: "",
                          categoryName: _areaProvider!.areasList[index].text,
                          categoryId: _areaProvider!.areasList[index].id,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Center(
                          child: _areaProvider!.loadingpagenationApi
                              ? SpinKitFadingCircle(color: mainAppColor)
                              : Container(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
  }
}
