import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/utils/urls.dart';

import '../networking/api_provider.dart';

class MediaProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  List<File> adMedia = [];

  void setAdMedia(File? media) {
    adMedia.add(media!);
    notifyListeners();
  }

  List<File> get adMediaList => adMedia;

  String? _mediaToken;
  void setMediaToken(String token) {
    _mediaToken = token;
    notifyListeners();
  }

  String get mediaToken => _mediaToken!;

  Future<void> uploadMedia(List<File> mediaList, BuildContext context) async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['files[]'] = mediaList.map((image) {
      if (image != null) {
        String fileName = image.path.split('/').last;
        return MultipartFile.fromFileSync(
          image.path,
          filename: fileName,
        );
      } else {
        print("not has inages");
        return null;
      }
    }).toList();

    data['collection'] = 'AD';
    FormData formData = FormData.fromMap(data);
    print('data:${formData.files}');

    final result = await _apiProvider.postWithDio(Urls.UPLOAD_MEDIA_URL,
        headers: {
          // "Accept-Language": _authProvider.currentLang,
          //  'Content-Type': 'application/json',
          'Accept': 'application/json',
          //  'Authorization': 'Bearer ${_authProvider.userToken}'
        },
        body: formData);

    if (result['status_code'] == 200) {
      print(result);
      setMediaToken(result['response']['token']);
      print("media_token:$mediaToken");
    } else {
      print(result);
    }
  }
}
