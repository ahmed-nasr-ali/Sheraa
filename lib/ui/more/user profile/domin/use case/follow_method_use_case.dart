import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/user%20profile/domin/repository/user_repositoryt.dart';

class FollowMethodUseCase {
  UserRepository userRepository;

  FollowMethodUseCase({
    required this.userRepository,
  });

  Future<bool> call(BuildContext context, int userId) async {
    return await userRepository.followMethod(context, userId);
  }
}
