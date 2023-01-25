// ignore_for_file: must_be_immutable, unused_element, unnecessary_null_comparison, unused_local_variable

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad%20price/ad_price.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad%20specifications/ad_specifications_widget.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad%20views%20and%20statistics/ad_views_and_statistics.dart';
import 'package:sheraa/ui/specific%20ad/widgets/add%20location/ad_location.dart';

import 'save ad widget/save_ad_communication_part.dart';
import 'save ad widget/save_ad_image.dart';
import 'save ad widget/save_ad_user_profile.dart';

class SaveAdScreen extends StatefulWidget {
  AdEntity adDetails;
  SaveAdScreen({
    Key? key,
    required this.adDetails,
  }) : super(key: key);

  @override
  State<SaveAdScreen> createState() => _SaveAdScreenState();
}

class _SaveAdScreenState extends State<SaveAdScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  ScreenshotController controller = ScreenshotController();
  Uint8List? image;
  Future takeScreenShot() async {
    image = await controller.capture(delay: Duration(milliseconds: 200));
    print("${image != null}");
    print('enter');
    print(image!.length);
  }

  Future<void> saveAdImage(Uint8List? image, BuildContext context) async {
    await saveImage(image!).then((value) {
      if (image != null) {
        snakBarWidget(
            context: context,
            content:
                AppLocalizations.of(context)!.translate("Save Ad Scussfully"));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      setState(() {
        takeScreenShot().then((value) => saveAdImage(image, context));
      });
    });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //
    //    // takeScreenShot();
    //
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Screenshot(
          controller: controller,
          child: Scaffold(
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //(صور الاعلان )

                    SaveAdImagesWidgets(
                      adImages: widget.adDetails.image ?? [],
                    ),

                    ///(مشاهدات الاعلان و الاحصائيات )
                    AdViewsAndStatistics(
                      adID: widget.adDetails.id ?? 0,
                      pageName: "notmoreInformation",
                      adViews: widget.adDetails.views.toString(),
                    ),

                    ///(مواصفات الاعلان و وصف الاعلان)
                    AdSpecificationsAndDecribtionWidget(
                      adID: (widget.adDetails.id).toString(),
                      adName: widget.adDetails.name ?? "",
                      adSingleOptions: widget.adDetails.singleSelection ?? [],
                      adMultiOptions: widget.adDetails.multiSelection ?? [],
                      adDescribtion: widget.adDetails.description ?? "",
                      adCreatedAt: widget.adDetails.createdAt ?? "",
                      isSave: true,
                    ),

                    ///(سعر الاعلان  )
                    ///( لو غير كدا دخل اي اسمpageName=MyAdلو دا اعلاني )

                    AdPrice(
                      ad_Id: widget.adDetails.id ?? 0,
                      pageName: "MyAd",
                      adPrice: widget.adDetails.price ?? "",
                    ),

                    ///(موقع الاعلان)
                    AdLocation(
                      isSaveAd: true,
                      adCity: widget.adDetails.city == null
                          ? "لا يوجد مدينة"
                          : widget.adDetails.city!.name ?? "",
                      adArea: widget.adDetails.area!.name ?? "",
                    ),
                    SaveAdUserProfile(
                      userDetails: widget.adDetails.user!,
                      userName: widget.adDetails.user!.name ?? "",
                      userImageUrl: widget.adDetails.user!.avatar ?? "",
                      userCreatedAt: widget.adDetails.user!.createdAt ?? "",
                      userLocaledType: widget.adDetails.user!.type ?? "",
                    ),

                    (widget.adDetails.disableComments ?? false)
                        ? Container()
                        : SaveAdCommunicationPart(
                            userPhoneNumber: widget.adDetails.user!.phone ?? "",
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    print("comes here");
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll(".", "-")
        .replaceAll(":", "-");

    final name = "Sheraa_AD_ScreenShot_$time";

    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    print(result["filePath"]);
    return result['filePath'];
  }
}
