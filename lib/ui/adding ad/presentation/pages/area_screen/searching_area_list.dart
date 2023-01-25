import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/area_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_area_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/category_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class SearchingAreaList extends StatefulWidget {
  final bool chooseCityFromFilter;

  const SearchingAreaList({
    Key? key,
    required this.chooseCityFromFilter,
  }) : super(key: key);

  @override
  State<SearchingAreaList> createState() => _SearchingAreaListState();
}

class _SearchingAreaListState extends State<SearchingAreaList> {
  AddingAdAreaProvider? _areaProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  bool _isSearchingLoading = false;

  Future searchingPagenationApi() async {
    _isSearchingLoading = true;

    setState(() {});

    await AddingAdAreaController.searchingPagenationApi(
        context, _pageNumber, true, _areaProvider!.searchingText);

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
    _areaProvider = Provider.of<AddingAdAreaProvider>(context, listen: false);
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
            itemCount: _areaProvider!.searchingAreasList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: CategoryWidget(
                  pageName: "",
                  categoryName: _areaProvider!.searchingAreasList[index].text,
                  categoryId: _areaProvider!.searchingAreasList[index].id,
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
