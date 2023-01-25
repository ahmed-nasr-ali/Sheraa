import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getCurrentUserData(BuildContext context);

  Future<bool> updateCurrentUserData(BuildContext context, FormData formData);

  Future<bool> followMethod(BuildContext context, int userId);

  Future<List<UserEntity>> getFollowersUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText);

  Future<List<UserEntity>> getFollowingUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText);
}
