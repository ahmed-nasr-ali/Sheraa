import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/domin/repository/user_repositoryt.dart';

class GetCurrentUserDataUseCase {
  UserRepository userRepository;

  GetCurrentUserDataUseCase({
    required this.userRepository,
  });

  Future<UserEntity> call(BuildContext context) async {
    return await userRepository.getCurrentUserData(context);
  }
}
