import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_editor/image_editor.dart' hide ImageSource;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/ad/adding_ad_screen.dart';
import 'package:sheraa/ui/ad/widgets/ad_images.dart';
import 'package:sheraa/utils/app_colors.dart';

class ExtendedImageExample extends StatefulWidget {
  final File image;

  const ExtendedImageExample({Key? key, required this.image}) : super(key: key);
  @override
  _ExtendedImageExampleState createState() => _ExtendedImageExampleState();
}

class _ExtendedImageExampleState extends State<ExtendedImageExample> {
  final GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey();

  File? sourceImage=File("image.jpg");
  ImageProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    //sourceImage=widget.image;
    provider = ExtendedFileImageProvider(File(widget.image.path), cacheRawData: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,

      appBar: CustomAppbar(
        hasCenterLogo: false,

        title: AppLocalizations.of(context)!.translate('edit'),
        hasBackBtn: true,
        backButtonAction:()=>Navigator.pop(context),
        trailingWidget: Container(
          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              await crop();
            },
          ),
        )
       
    ),
      // AppBar(
      //  // title: const Text('Use extended_image library'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.photo),
      //       onPressed: _pick,
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.check),
      //       onPressed: () async {
      //         await crop();
      //       },
      //     ),
      //   ],
      // ),
      body: Container(
        height: double.infinity,
       // height: MediaQuery.of(context).size.height,

       // color: mainAppColor,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
              child: buildImage(),
            ),
            // Expanded(
            //   child: SliderTheme(
            //     data: const SliderThemeData(
            //       showValueIndicator: ShowValueIndicator.always,
            //     ),
            //     child: Column(
            //       children: <Widget>[
            //         _buildSat(),
            //         _buildBrightness(),
            //         _buildCon(),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: _buildFunctions(),
    );
  }

  Widget buildImage() {
    return ExtendedImage(
      image: provider!,
      height: 800,
      width: 600,
      extendedImageEditorKey: editorKey,
      mode: ExtendedImageMode.editor,
      fit: BoxFit.contain,
      initEditorConfigHandler: (_) => EditorConfig(
        maxScale: 8.0,
        cropRectPadding: const EdgeInsets.all(20.0),
        hitTestSize: 100.0,
        cropAspectRatio: 1 / 2,
      ),
    );
  }

  Widget _buildFunctions() {
    return BottomNavigationBar(
      backgroundColor: whiteColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.flip),
          label: 'Flip',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rotate_left),
          label: 'Rotate left',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rotate_right),
          label: 'Rotate right',
        ),


      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            flip();
            break;
          case 1:
            rotate(false);
            break;
          case 2:
            rotate(true);
            break;
        }
      },
      currentIndex: 0,
      selectedItemColor:mainAppColor,
      unselectedItemColor: blackColor,
    );
  }

  Future<void> crop([bool test = false]) async {
    final ExtendedImageEditorState? state = editorKey.currentState;
    if (state == null) {
      return;
    }
    final Rect? rect = state.getCropRect();
    if (rect == null) {
      print('The crop rect is null.');
      return;
    }
    final EditActionDetails action = state.editAction!;
    final double radian = action.rotateAngle;

    final bool flipHorizontal = action.flipY;
    final bool flipVertical = action.flipX;
    // final img = await getImageFromEditorKey(editorKey);
    final Uint8List? img = state.rawImageData;

    if (img == null) {
      print('The img is null.');
      return;
    }

    final ImageEditorOption option = ImageEditorOption();

    option.addOption(ClipOption.fromRect(rect));
    option.addOption(
        FlipOption(horizontal: flipHorizontal, vertical: flipVertical));
    if (action.hasRotateAngle) {
      option.addOption(RotateOption(radian.toInt()));
    }

    option.addOption(ColorOption.saturation(sat));
    option.addOption(ColorOption.brightness(bright));
    option.addOption(ColorOption.contrast(con));

    option.outputFormat = const OutputFormat.png(88);

    print(const JsonEncoder.withIndent('  ').convert(option.toJson()));

    final DateTime start = DateTime.now();
    final Uint8List? result = await ImageEditor.editImage(
      image: img,
      imageEditorOption: option,
    );

    print('result.length = ${result?.length}');
    print("image: ${img.length}");
    final Duration diff = DateTime.now().difference(start);

    print('image_editor time : $diff');

    if (result == null) return;
    final Directory dir = await getApplicationDocumentsDirectory();
    final String appDir = dir.path;
    File fileImage =  File('$appDir/image.png');
    // if (await fileImage.exists()) {
    //    fileImage.delete();
    // }else{
    //
    // }
    // imageCache!.clearLiveImages();
    // imageCache!.clear();
    print("img:${fileImage.path}");

     // final File copiedImage = await File('$appDir/image.jpg').copy('$appDir/image.jpg');
     // File myImage = File(copiedImage.path);

     Navigator.pop(context,fileImage.writeAsBytes(result));
    //showPreviewDialog(fileImage);
   // Navigator.pop(context);
  }

  void flip() {
    editorKey.currentState?.flip();
  }

  void rotate(bool right) {
    editorKey.currentState?.rotate(right: right);
  }



  void showPreviewDialog(File image)async {
 // File img=   File.fromRawPath( image);
 //  print("img:${img}");
 // store unit8List image here ;

    showDialog<void>(
      context: context,
      builder: (BuildContext ctx) => GestureDetector(
        onTap: () => {
          Navigator.pop(context),

        },
        child: Container(
          color: Colors.grey.withOpacity(0.5),
          child: Center(
            child: SizedBox.fromSize(
              size: const Size.square(200),
              child: Container(
                child: Image.file(image),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pick() async {
    final XFile? result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (result == null) {
      print('The pick file is null');
      return;
    }
    print(result.path);
    provider = ExtendedFileImageProvider(File(result.path), cacheRawData: true);
    setState(() {});
  }

  double sat = 1;
  double bright = 1;
  double con = 1;

  Widget _buildSat() {
    return Slider(
      label: 'sat : ${sat.toStringAsFixed(2)}',
      onChanged: (double value) {
        setState(() {
          sat = value;
        });
      },
      value: sat,
      min: 0,
      max: 2,
    );
  }

  Widget _buildBrightness() {
    return Slider(
      label: 'brightness : ${bright.toStringAsFixed(2)}',
      onChanged: (double value) {
        setState(() {
          bright = value;
        });
      },
      value: bright,
      min: 0,
      max: 2,
    );
  }

  Widget _buildCon() {
    return Slider(
      label: 'con : ${con.toStringAsFixed(2)}',
      onChanged: (double value) {
        setState(() {
          con = value;
        });
      },
      value: con,
      min: 0,
      max: 4,
    );
  }
}