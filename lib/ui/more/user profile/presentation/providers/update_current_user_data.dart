import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';

import '../../domin/use case/update_current_user_use_case.dart';

class UpdateCurrentUserProvider extends ChangeNotifier {
  UpdateCurrentUserUseCase updateCurrentUserUseCase;

  UpdateCurrentUserProvider({
    required this.updateCurrentUserUseCase,
  });

  Future<bool> updateCurrentUserDataMethod(
      BuildContext context, FormData formData) async {
    return await updateCurrentUserUseCase.call(context, formData);
  }

  String userImage = "";

  void setUSerImage(String _userImage) {
    userImage = _userImage;

    print(userImage);
    notifyListeners();
  }

  String userGender = UserData.getUserGender() ?? "";

  void setUserGender(String _userGender) {
    userGender = _userGender;
    print("user gender provider is : ");
    print(userGender);
    notifyListeners();
  }

  bool isHiddenUserPhone = UserData.getHiddenUserPhoneNumber() ?? false;

  void setHiddenUserPhone(bool _isHidden) {
    isHiddenUserPhone = _isHidden;
    print("user isHiddenUserPhone provider is : ");
    print(isHiddenUserPhone);
    notifyListeners();
  }

  int groupId = UserData.getAgeId() ?? 0;

  void setUsergroupAgeId(int _groupAgeId) {
    groupId = _groupAgeId;
    print("user groupId provider is : ");
    print(groupId);
    notifyListeners();
  }
}
