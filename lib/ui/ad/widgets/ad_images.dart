import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/providers/media_provider.dart';
import 'package:sheraa/ui/ad/widgets/ad_videos.dart';
import 'package:sheraa/ui/edit_images/edit_image.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:video_player/video_player.dart';

class ADImages extends StatefulWidget {
  final List<File>? adImages;

  const ADImages({
    Key? key,
    required this.adImages,
  }) : super(key: key);

  @override
  _ADImagesState createState() => _ADImagesState();
}

class _ADImagesState extends State<ADImages> {
  double _height = 0;
  double _width = 0;

  File? _image;
  MediaProvider? mediaProvider;
  bool initialRun = true;
  @override
  void initState() {
    // TODO: implement initState
    addImageList();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (initialRun) {
      mediaProvider = Provider.of<MediaProvider>(
        context,
      );

      initialRun = false;
    }
  }

  void addImageList() {
    //adImages.add(widget.adImge);
  }

  Future _getImage(int index, File editImage) async {
    print("edit imge:${editImage.path}");
    //var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (editImage != null) {

      widget.adImages!.removeAt(index);
     // widget.adImages!.insert(index, _image!);
      widget.adImages!.insert(index, editImage);
      mediaProvider!.adMediaList.removeAt(index);
      mediaProvider!.adMediaList.insert(index, editImage);
      setState(() {
        print(editImage.path.toString());
        print("_mediaimages:${mediaProvider!.adMediaList.length}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return GridView.builder(
        shrinkWrap: true,
         physics: ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 /2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3),
        itemCount: widget.adImages!.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: _height*0.01,horizontal: _width*0.01),
            child: Stack(
              children: [
                Container(
                  width: _width*0.5,
                  height: _height*0.5,

                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                            widget.adImages!.elementAt(index)),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    //height: 50,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: _height * 0.25,
                                color: Colors.transparent,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight:
                                              Radius.circular(20))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () async{
                                          Navigator.pop(context);

                                          //  _getImage(index);
                                        var image  =await Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                              ExtendedImageExample(image:widget.adImages![index],)));
                                         print(image.path);
                                            _getImage(index, image);
                                          // mediaProvider!.setAdImages(widget.adImages);
                                          // print("media in provider is :${mediaProvider!.adImages.length}");
                                        },
                                        child: Text(
                                          "تعديل الصورة",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontSize: 15,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ),
                                      ),
                                      Divider(),
                                      InkWell(
                                        onTap: () {
                                          widget.adImages!
                                              .removeAt(index);
                                          mediaProvider!.adMediaList
                                              .removeAt(index);

                                          setState(() {
                                            print(widget
                                                .adImages!.length);
                                            print(
                                                "media length after remove:"
                                                    "${mediaProvider!.adMediaList.length}");
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "حذف الصورة",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontSize: 15,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ),
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          widget.adImages!.insert(
                                              0,
                                              widget.adImages!
                                                  .removeAt(index));
                                          mediaProvider!.adMediaList.insert(
                                              0,
                                              mediaProvider!.adMediaList
                                                  .removeAt(index));

                                          setState(() {});
                                        },
                                        child: Text(
                                          "اجعلها الصورة الرئيسية",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontSize: 15,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: textGrayColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: SmallText(
                          text: "تعديل",
                          align: TextAlign.center,
                          color: whiteColor,
                          size: 12,
                        ),
                      ),
                    ))
                // AssetImage("assets/images/white-car.png",),
              ],
            ),
          );
        });
  }
}
