// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/ui/adding%20ad/presentation/controller/feature_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/feature_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class ListOfFeatureUi extends StatefulWidget {
  int categoryId;
  ListOfFeatureUi({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<ListOfFeatureUi> createState() => _ListOfFeatureUiState();
}

class _ListOfFeatureUiState extends State<ListOfFeatureUi> {
  FeatureProvider? _featureProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  Future fetch() async {
    await FeatureController.fetchData(context, 1, widget.categoryId);

    setState(() {});
  }

  Future pagenationApi() async {
    await FeatureController.pagenationApi(
        context, _pageNumber, widget.categoryId);

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

    _featureProvider = Provider.of<FeatureProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _featureProvider!.isLoading
        ? Center(
            child: SpinKitFadingCircle(color: mainAppColor),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  shrinkWrap: true,
                  itemCount: _featureProvider!.featureList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < _featureProvider!.featureList.length) {
                      return FeatureWidget(
                        featureName: _featureProvider!.featureList[index].name,
                        featureId: _featureProvider!.featureList[index].id,
                        slectType:
                            _featureProvider!.featureList[index].selectionType,
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Center(
                          child: _featureProvider!.loadingpagenationApi
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
