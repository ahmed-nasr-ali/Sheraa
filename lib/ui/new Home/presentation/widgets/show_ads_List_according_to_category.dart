// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/specific%20ad%20screen/specific_ad_screen.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/get_all_comments_provider.dart';

class ShowAdsListAccordingToCategory extends StatefulWidget {
  List<AdEntity> adsList;
  ShowAdsListAccordingToCategory({
    Key? key,
    required this.adsList,
  }) : super(key: key);

  @override
  State<ShowAdsListAccordingToCategory> createState() =>
      _ShowAdsListAccordingToCategoryState();
}

class _ShowAdsListAccordingToCategoryState
    extends State<ShowAdsListAccordingToCategory> {
  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: _height! / 5.6,
      // color: redColor,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: _width! / 75),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.adsList.length,
          itemBuilder: (context, index) {
            return buildAdCard(index, widget.adsList[index]);
          }),
    );
  }

  Widget buildAdCard(int index, AdEntity adsList) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _width! / 75),
      width: _width! / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_height! / 81.2), //25
        border: Border.all(
          color: Color(0xFFEBEBEB),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Provider.of<GetAllCommentsProvider>(context, listen: false)
              .setAllDateToDefault();
          print("object");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SpecificAdScreenDetails(
                pageName: "notmoreInformation", //moreInformation (second case)
                isMyAd: false,
                adDetails: adsList,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: _height! / 7.381818181818182, //110
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(_height! / 81.2), //25
                        topLeft: Radius.circular(_height! / 81.2)), //25
                    //  color: Colors.red,
                    image: adsList.image!.length != 0
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(adsList.image![0]))
                        : DecorationImage(
                            //fit: BoxFit.cover,
                            image: AssetImage("assets/images/logo.png")),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: _height! / 38.66666666666667,
              width: _width! / 4.166666666666667,
              decoration: BoxDecoration(
                color: Color(0xffF1F0F5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    // color: mainAppColor,
                    width: _width! / 8.333333333333333,
                    child: SmallText(
                      align: TextAlign.end,
                      text: adsList.price.toString(),
                      color: Color(0xff392D78),
                      typeOfFontWieght: 1,
                      size: _height! / 67.66666666666667,
                    ),
                  ),
                  SmallText(
                    text: " " + AppLocalizations.of(context)!.translate("rial"),
                    color: Color(0xff392D78),
                    size: _height! / 81.2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
