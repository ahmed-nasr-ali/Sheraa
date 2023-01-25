import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/cities_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_cities_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class ListOfCitiesUi extends StatefulWidget {
  final bool fromFilter;

  ListOfCitiesUi({
    Key? key,
    required this.fromFilter,
  }) : super(key: key);

  @override
  State<ListOfCitiesUi> createState() => _ListOfCitiesUiState();
}

class _ListOfCitiesUiState extends State<ListOfCitiesUi> {
  AddingAdCitiesProvider? _citiesProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  double? _width;

  Future fetch() async {
    await AddingAdCitiesController.fetchData(context, 1, false, "");

    setState(() {});
  }

  Future pagenationApi() async {
    await AddingAdCitiesController.pagenationApi(
        context, _pageNumber, false, "");

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

    _citiesProvider =
        Provider.of<AddingAdCitiesProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return _citiesProvider!.isLoading
        ? Center(
            child: SpinKitFadingCircle(color: mainAppColor),
          )
        : Column(children: [
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
                  itemCount: _citiesProvider!.citiesList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < _citiesProvider!.citiesList.length) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            AddingAdCitiesController.onTapOnCategoryAction(
                              context,
                              _citiesProvider!.citiesList[index].text,
                              _citiesProvider!.citiesList[index].id,
                              widget.fromFilter,
                            );
                          });
                        },
                        child: CategoryWidget(
                          pageName: "choose city",
                          categoryName: _citiesProvider!.citiesList[index].text,
                          categoryId: _citiesProvider!.citiesList[index].id,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Center(
                          child: _citiesProvider!.loadingpagenationApi
                              ? SpinKitFadingCircle(color: mainAppColor)
                              : Container(),
                        ),
                      );
                    }
                  }),
            ),
          ]);
  }
}
