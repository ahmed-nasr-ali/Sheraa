// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/main_category_screen/main_category_body.dart';
import 'package:sheraa/utils/app_colors.dart';

class MainCategoryScreen extends StatelessWidget {
  final bool chooseDepartmentFilter;
  MainCategoryScreen({
    Key? key,
    required this.chooseDepartmentFilter,
  }) : super(key: key);

  double? _height;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: SmallText(
              text: chooseDepartmentFilter
                  ? AppLocalizations.of(context)!.translate('departments')
                  : AppLocalizations.of(context)!.translate('main_department'),
              color: blackColor,
              size: _height! / 50.75,
              typeOfFontWieght: 1,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: blackColor,
                size: 15,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: _height! / 81.2,
              ),
              Divider(
                height: 0,
                color: containerColor,
              ),
              Expanded(
                child: MainCategoryBody(
                  chooseDepartmentFilter: chooseDepartmentFilter,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
