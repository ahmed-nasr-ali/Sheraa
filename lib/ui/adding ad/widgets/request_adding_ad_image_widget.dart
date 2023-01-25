// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/media_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestAddingAdImageWidget extends StatelessWidget {
  RequestAddingAdImageWidget({Key? key}) : super(key: key);

  double? _width;
  double? _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Divider(
          thickness: 1,
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height! / 45.11111111111111, //18
        ),
        Provider.of<MediaProvider>(context, listen: false).adMedia.isEmpty
            ? Container()
            : Container(
                height: _height! / 8.12,
                width: _width,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    right: UserData.getUSerLang() == "ar" ? _width! / 37.5 : 0,
                    left: UserData.getUSerLang() == "en" ? _width! / 37.5 : 0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: Provider.of<MediaProvider>(context, listen: false)
                      .adMedia
                      .length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: _width! / 3.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(Provider.of<MediaProvider>(
                                        context,
                                        listen: false)
                                    .adMedia
                                    .elementAt(index)),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(
                                  _height! / 54.13333333333333)),
                        ),
                        SizedBox(
                          width: _width! / 37.5,
                        )
                      ],
                    );
                  },
                ),
              ),
        SizedBox(
          height:
              Provider.of<MediaProvider>(context, listen: false).adMedia.isEmpty
                  ? 0
                  : _height! / 62.46153846153846, //13
        ),
        Provider.of<MediaProvider>(context, listen: false).adMedia.isEmpty
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _width! / 20.83333333333333 //18
                    ),
                child: SmallText(
                  text: AppLocalizations.of(context)!.translate(
                      "Pictures_increase_your_chances_of_selling_more_than_5_times"),
                  color: Colors.red,
                  size: _height! / 67.66666666666667, //12
                  typeOfFontWieght: 0,
                ),
              ),
        SizedBox(
          height:
              Provider.of<MediaProvider>(context, listen: false).adMedia.isEmpty
                  ? 0
                  : _height! / 62.46153846153846, //13
        ),
        Provider.of<MediaProvider>(context, listen: false).adMedia.isEmpty
            ? Container()
            : Divider(
                thickness: 1,
                height: 0,
                color: containerColor,
              ),
      ],
    );
  }
}
