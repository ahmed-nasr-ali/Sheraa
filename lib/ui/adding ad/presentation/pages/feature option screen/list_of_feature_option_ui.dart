// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/controller/feature_option_controller.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_option_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/feature_option_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class ListOfFeatureOptionUi extends StatefulWidget {
  int featureId;
  String appBarText;
  String slectType;

  ListOfFeatureOptionUi({
    Key? key,
    required this.featureId,
    required this.appBarText,
    required this.slectType,
  }) : super(key: key);

  @override
  State<ListOfFeatureOptionUi> createState() => _ListOfFeatureOptionUiState();
}

class _ListOfFeatureOptionUiState extends State<ListOfFeatureOptionUi> {
  List itemSelect = [];

  FeatureOptionProvider? _featureOptionProvider;

  final controller = ScrollController();

  int _pageNumber = 2;

  double? _width;

  Future fetch() async {
    await FeatureOptionController.fetchData(context, 1, widget.featureId);

    setState(() {});
  }

  Future pagenationApi() async {
    await FeatureOptionController.pagenationApi(
        context, _pageNumber, widget.featureId);

    _pageNumber += 1;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetch();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeatureOptionController.afterBuildOptionList(
          context, widget.slectType, widget.appBarText, itemSelect);
    });

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        pagenationApi();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _featureOptionProvider =
        Provider.of<FeatureOptionProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return _featureOptionProvider!.isLoading
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
                    );
                  },
                  itemCount:
                      _featureOptionProvider!.featureOptionList.length + 1,
                  itemBuilder: (context, index) {
                    if (index <
                        _featureOptionProvider!.featureOptionList.length) {
                      return InkWell(
                        onTap: () {
                          if (widget.slectType == "single") {
                            FeatureOptionController.onTapOnOptionSingleSelect(
                              context,
                              widget.appBarText,
                              _featureOptionProvider!
                                  .featureOptionList[index].text,
                              _featureOptionProvider!
                                  .featureOptionList[index].id,
                              itemSelect,
                            );
                          } else {
                            setState(() {
                              FeatureOptionController.onTapOnOptionMultiSelect(
                                context,
                                widget.appBarText,
                                _featureOptionProvider!
                                    .featureOptionList[index].text,
                                _featureOptionProvider!
                                    .featureOptionList[index].id,
                                itemSelect,
                              );
                            });
                          }
                        },
                        child: FeatureOptionWidget(
                            isSelect: widget.slectType == "single"
                                ? itemSelect.contains(_featureOptionProvider!
                                        .featureOptionList[index].id)
                                    ? true
                                    : false
                                : Provider.of<AddOptionsIdAndFeatureName>(
                                            context,
                                            listen: false)
                                        .categoryID
                                        .contains(_featureOptionProvider!
                                            .featureOptionList[index].id)
                                    ? true
                                    : false,
                            imgUrl: _featureOptionProvider!
                                .featureOptionList[index].imgUrl,
                            optionText: _featureOptionProvider!
                                .featureOptionList[index].text),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Center(
                          child: _featureOptionProvider!.loadingpagenationApi
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
