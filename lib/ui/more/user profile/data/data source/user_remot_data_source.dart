import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/user%20profile/data/model/user_model.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls/user%20urls/user_urls.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUSerData(BuildContext context);

  Future<bool> updateCurrentUserData(BuildContext context, FormData formData);

  Future<bool> followMethod(BuildContext context, int userId);

  Future<List<UserModel>> getFollowingUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText);

  Future<List<UserModel>> getFollowersUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText);
}

class UserRemoteDataSourceIMp extends UserRemoteDataSource {
  ApiProvider _apiProvider = ApiProvider();
  @override
  Future<UserModel> getCurrentUSerData(BuildContext context) async {
    UserModel _userdata = UserModel();

    final response = await _apiProvider.get(
      "${UserUrls.USER_PROFILE_URL}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    print(response['status_code']);

    if (response['status_code'] == 200) {
      Map<String, dynamic> iterable = response['response']['data'];

      _userdata = UserModel.fromJson(iterable);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    print(_userdata.name);
    return _userdata;
  }

  @override
  Future<bool> updateCurrentUserData(
      BuildContext context, FormData formData) async {
    final response = await _apiProvider.postWithDio(
      "${UserUrls.USER_PROFILE_URL}",
      headers: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: formData,
    );

    if (response["status_code"] == 200) {
      return true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
      return false;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }

  @override
  Future<bool> followMethod(BuildContext context, int userId) async {
    final response = await _apiProvider.post(
      "${UserUrls.Follow_URl}profile/$userId/toggle",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response['status_code'] == 204) {
      return true;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }

  @override
  Future<List<UserModel>> getFollowersUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText) async {
    List<UserModel> _followeUseData = [];

    print(
        "${UserUrls.Follow_URl}followers/$userId?page=$pageNumber&name=$searchingText");

    final response = await _apiProvider.get(
      "${UserUrls.Follow_URl}followers/$userId?page=$pageNumber&name=$searchingText",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _followeUseData =
          iterable.map((model) => UserModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _followeUseData;
  }

  @override
  Future<List<UserModel>> getFollowingUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText) async {
    List<UserModel> _followingUseData = [];

    print(
        "${UserUrls.Follow_URl}followers/$userId?page=$pageNumber&name=$searchingText");

    final response = await _apiProvider.get(
      "${UserUrls.Follow_URl}following/$userId?page=$pageNumber&name=$searchingText",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _followingUseData =
          iterable.map((model) => UserModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _followingUseData;
  }
}
