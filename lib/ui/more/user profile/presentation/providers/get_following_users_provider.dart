import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';

import 'package:sheraa/ui/more/user%20profile/domin/use%20case/following_users_use_case.dart';

class GetFollowingUsersProvider extends ChangeNotifier {
  FollowingUsersUseCase followingUsersUseCase;

  GetFollowingUsersProvider({
    required this.followingUsersUseCase,
  });

  Future<List<UserEntity>> getFollowingUsers(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText) async {
    return await followingUsersUseCase.call(
        context, userId, pageNumber, isSearching, searchingText);
  }
}
