// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/1%20-current%20user%20information%20screen/current_user_information_screen.dart';

import '../providers/update_current_user_data.dart';

class UpdateCurrentUserDataController {
  static Future<bool> updateCurrentUserDataMethod(BuildContext context,
      String userName, String userEmail, String userPhone) async {
    final _updateUserProvider =
        Provider.of<UpdateCurrentUserProvider>(context, listen: false);

    String? fileName = _updateUserProvider.userImage == ""
        ? ""
        : _updateUserProvider.userImage.split('/').last;

    FormData formData = FormData.fromMap(
      {
        "name": userName,
        "email": userEmail,
        "phone": userPhone,
        "avatar": _updateUserProvider.userImage == ""
            ? null
            : await MultipartFile.fromFile(
                _updateUserProvider.userImage,
                filename: fileName,
              )
      },
    );

    bool resultFromRequest = await _updateUserProvider
        .updateCurrentUserDataMethod(context, formData);

    if (resultFromRequest) {
      UserData.setUserGender(_updateUserProvider.userGender);

      UserData.setHiddenUserPhoneNumber(_updateUserProvider.isHiddenUserPhone);

      UserData.setAgeId(_updateUserProvider.groupId);

      Provider.of<NavigationProvider>(context, listen: false)
          .upadateNavigationIndex(4);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => BottomNavigation(),
          ),
          (route) => false);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CurrentUserInformations()),
      );

      snakBarWidget(context: context, content: "تم تعديل معلومات حسابك بنجاح");

      return true;
    } else {
      return false;
    }
  }
}
