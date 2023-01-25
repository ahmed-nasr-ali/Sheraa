import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/ui/more/user%20profile/data/data%20source/user_remot_data_source.dart';

import '../../domin/entity/user_entity.dart';
import '../../domin/repository/user_repositoryt.dart';

class UserRepositoryIMP extends UserRepository {
  UserRemoteDataSource userRemoteDataSource;

  UserRepositoryIMP({
    required this.userRemoteDataSource,
  });

  @override
  Future<UserEntity> getCurrentUserData(BuildContext context) async {
    return await userRemoteDataSource.getCurrentUSerData(context);
  }

  @override
  Future<bool> updateCurrentUserData(
      BuildContext context, FormData formData) async {
    return await userRemoteDataSource.updateCurrentUserData(context, formData);
  }

  @override
  Future<bool> followMethod(BuildContext context, int userId) async {
    return await userRemoteDataSource.followMethod(context, userId);
  }

  @override
  Future<List<UserEntity>> getFollowersUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText) async {
    return await userRemoteDataSource.getFollowersUsers(
        context, userId, pageNumber, isSearching, searchingText);
  }

  @override
  Future<List<UserEntity>> getFollowingUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText) async {
    return await userRemoteDataSource.getFollowingUsers(
        context, userId, pageNumber, isSearching, searchingText);
  }
}
