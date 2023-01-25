import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/domin/repository/user_repositoryt.dart';

class FollowersUsersUseCase {
  UserRepository userRepository;

  FollowersUsersUseCase({
    required this.userRepository,
  });

  Future<List<UserEntity>> call(BuildContext context, int userId,
      int pageNumber, bool isSearching, String searchingText) async {
    return await userRepository.getFollowersUsers(
        context, userId, pageNumber, isSearching, searchingText);
  }
}
