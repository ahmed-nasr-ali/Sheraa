import 'package:flutter/material.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/domin/use%20case/followers_users_use_case.dart';

class GetFollowersUsersProvider extends ChangeNotifier {
  FollowersUsersUseCase followersUsersUseCase;

  GetFollowersUsersProvider({
    required this.followersUsersUseCase,
  });

  Future<List<UserEntity>> getFollowingUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText) async {
    return await followersUsersUseCase.call(
        context, userId, pageNumber, isSearching, searchingText);
  }
}
