// ignore_for_file: unused_field, unused_local_variable, non_constant_identifier_names, unnecessary_statements

import 'package:flutter/cupertino.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class FollowMethodsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  List<User> _followingUsers = [];

  List<User> _searchingFollowingUsers = [];

  List<User> get followingUsers => _followingUsers;

  List<User> get searchingFollowingUser => _searchingFollowingUsers;

  Future<bool> getFollowingUserList(
      BuildContext context, String userID, bool isFollowing) async {
    String urlText = isFollowing ? "following" : "followers";

    print("${Urls.Follow_URl}$urlText/$userID");

    final response = await _apiProvider.get(
      "${Urls.Follow_URl}$urlText/$userID",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _followingUsers = iterable.map((model) => User.fromJson(model)).toList();
      return false;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }

  ///get searching following user
  getSearchingFollowingUserList(BuildContext context, String userID,
      String name, bool isFollowing) async {
    String urlText = isFollowing ? "following" : "followers";

    print("${Urls.Follow_URl}$urlText/$userID?name=$name");
    final response = await _apiProvider.get(
      "${Urls.Follow_URl}$urlText/$userID?name=$name",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response['status_code'] == 200) {
      print(_searchingFollowingUsers);
      Iterable iterable = response['response']['data'];

      _searchingFollowingUsers =
          iterable.map((model) => User.fromJson(model)).toList();
      print("=============================================");
      print(_searchingFollowingUsers.length);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    notifyListeners();
  }

  /// add or romve user from following list
  Future<bool> followingUser(BuildContext context, String userId) async {
    final response = await _apiProvider.post(
      "${Urls.Follow_URl}profile/$userId/toggle",
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

  ///update Ui in following user screen
  List UserromoveformFollowinglist = [];

  List UserAddToFollowingList = [];

  removeUserFromFollowingList(int id) {
    if (UserromoveformFollowinglist.contains(id)) {
      print("do nothing");
      UserromoveformFollowinglist.remove(id);
    } else {
      UserromoveformFollowinglist.add(id);
    }

    print("my remove list : $UserromoveformFollowinglist");
  }

  adUserToFollowingList(int id) {
    if (UserAddToFollowingList.contains(id)) {
      print("do nothing");
      UserAddToFollowingList.remove(id);
    } else {
      UserAddToFollowingList.add(id);
    }

    print("my adding list : $UserAddToFollowingList");
  }

  ///update Ui in specfic ad
  List _followedUser = [];

  List get followedUser => _followedUser;

  List toRemoveUserData = [];

  addfollowUser(Map<String, dynamic> userData, int userID) {
    _followedUser.forEach((item) {
      if (item.containsValue(userID)) {
        toRemoveUserData.add(item);
      }
    });

    _followedUser.removeWhere((element) => toRemoveUserData.contains(element));

    _followedUser.add(userData);

    print(_followedUser);

    notifyListeners();
  }
}
