import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/cities_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_cities_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class SearchingCitiesList extends StatefulWidget {
  final bool fromFilter;

  const SearchingCitiesList({
    Key? key,
    required this.fromFilter,
  }) : super(key: key);

  @override
  State<SearchingCitiesList> createState() => _SearchingCitiesListState();
}

class _SearchingCitiesListState extends State<SearchingCitiesList> {
  AddingAdCitiesProvider? _citiesProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  bool _isSearchingLoading = false;

  Future searchingPagenationApi() async {
    _isSearchingLoading = true;

    setState(() {});

    await AddingAdCitiesController.searchingPagenationApi(
        context, _pageNumber, true, _citiesProvider!.searchingText);

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
            itemCount: _citiesProvider!.searchingCitiesList.length,
            itemBuilder: (context, index) {
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
                  categoryName:
                      _citiesProvider!.searchingCitiesList[index].text,
                  categoryId: _citiesProvider!.searchingCitiesList[index].id,
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
