// ignore_for_file: unused_local_variable, must_be_immutable, nullable_type_in_catch_clause, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/open%20image/open_image.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/update_current_user_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class UserImage extends StatefulWidget {
  String userImage;

  UserImage({
    Key? key,
    required this.userImage,
  }) : super(key: key);

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File? imageSend;

  double? _height;
  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 54.13333333333333, //15
        ),
        Center(
          child: InkWell(
            onTap: openPhoto,
            child: Container(
              width: _width! / 4.6875,
              height: _height! / 10.15,
              child: Stack(
                children: [
                  Container(
                    child: ClipOval(
                      child: CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: MediaQuery.of(context).size.height / 20.3, // 40
                        child: Container(
                          height: MediaQuery.of(context).size.height /
                              9.552941176470588, //85
                          width: MediaQuery.of(context).size.width /
                              4.411764705882353, //85
                          child: imageSend != null
                              ? Image.file(
                                  imageSend!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.userImage,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: _height! / 16.24, //50

                      child: InkWell(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          width: _width! / 13.88888888888889, //27
                          height: _height! / 30.07407407407407, //27
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainAppColor,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: whiteColor,
                            size: _height! / 54.13333333333333,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void openPhoto() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => OpenImage(
            imageSend: imageSend != null ? imageSend : null,
            userImage: widget.userImage,
          ),
        ),
      );

  Future pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();

      final image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        return;
      } else {
        final authProvider =
            Provider.of<UpdateCurrentUserProvider>(context, listen: false);
        final ImageTemporary = File(image.path);
        setState(() {
          imageSend = ImageTemporary;
          print("======================");
          print(imageSend!.path);
        });
        authProvider.setUSerImage(imageSend!.path);
      }
    } on PlatformException catch (e) {
      print("failed to pich image $e");
    }
  }
}
