// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/providers/media_provider.dart';
import 'package:sheraa/shared_preferences/add_adds.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/ad/main_department.dart';
import 'package:sheraa/ui/ad/widgets/ad_images.dart';
import 'package:sheraa/ui/ad/widgets/ad_videos.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/main_category_screen/main_category_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class AddingAdScreen extends StatefulWidget {
  const AddingAdScreen({Key? key}) : super(key: key);

  @override
  _AddingAdScreenState createState() => _AddingAdScreenState();
}

class _AddingAdScreenState extends State<AddingAdScreen> {
  double _width = 0, _height = 0;

  File? _image;
  List<File>? _images = [];
  File? _pickedVideoFile;

  MediaProvider? mediaProvider;
  bool initialRun = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      unAuthUser(context);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (initialRun) {
      mediaProvider = Provider.of<MediaProvider>(
        context,
      );
      mediaProvider!.adMedia = [];
      initialRun = false;
    }
  }

  Future _getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image = File(image.path);
      _images!.add(_image!);
      mediaProvider!.setAdMedia(_image);
      setState(() {
        print(_image!.path.toString());
        print("_media in mediaProvider:${mediaProvider!.adMediaList.length}");
      });
    }
  }

  Future _pickVideo() async {
    var pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    _pickedVideoFile = File(pickedFile!.path);
    mediaProvider!.setAdMedia(File(pickedFile.path));
    setState(() {
      print("video file:${_pickedVideoFile!.path.toString()}");
    });
    print("media length:${mediaProvider!.adMediaList.length}");
  }

  Widget addMedia() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: AppLocalizations.of(context)!.translate("add_image"),
              fontWeight: FontWeight.bold,
              size: 15,
              color: blackColor,
            ),
            SizedBox(
              width: 2,
            ),
            SmallText(
              text: AppLocalizations.of(context)!.translate("50_image"),
              size: 15,
              color: redColor,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _getImage();
              },
              child: Container(
                height: _height * 0.22,
                width: _width * 0.45,
                margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                decoration: BoxDecoration(
                    color: mainAppColor,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/gallery_add.png'),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(
                        text: AppLocalizations.of(context)!
                            .translate("add_image"),
                        color: whiteColor,
                        size: 12,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                _pickVideo();
              },
              child: Container(
                height: _height * 0.22,
                width: _width * 0.45,
                margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                decoration: BoxDecoration(
                    color: mainAppColor,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/video.png'),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(
                        text: AppLocalizations.of(context)!
                            .translate("add_video"),
                        color: whiteColor,
                        size: 12,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        addMedia(),
        SizedBox(
          height: 10,
        ),
        _pickedVideoFile != null
            ? Expanded(
                child: VideoPlayerFileCustom(
                  videoPath: _pickedVideoFile!.path,
                ),
              )
            : Container(),
        _image == null
            ? Container()
            : Expanded(child: ADImages(adImages: _images!)),
        CustomButton(
            btnLbl: 'التالي', //todo
            onPressedFunction: () {
              print(mediaProvider!.adMediaList);
              mediaProvider!.uploadMedia(mediaProvider!.adMediaList, context);

              UserData.setMainCategoryId(0);
              UserData.setMainCategoryName("");

              UserData.setSubCategoryId(0);
              UserData.setSubCategoryName("");

              Provider.of<MainCategoryProvider>(context, listen: false)
                  .setAllDateToDefault();

              Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
                  .setAllDataToDefault();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MainCategoryScreen(chooseDepartmentFilter: false)
                      // MainDepartment(
                      //   chooseDepartmentFilter: false,
                      // ),
                      ));
            },
            btnColor: whiteColor,
            btnStyle: TextStyle(color: mainAppColor, fontSize: 16),
            borderColor: mainAppColor)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppbar(
          hasCenterLogo: false,
          title: AppLocalizations.of(context)!.translate('add_images'),
          hasBackBtn: true,
          backButtonAction: () => Navigator.pop(context)),
      body: buildBody(),
    );
  }
}
