import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/user%20profile/domin/repository/user_repositoryt.dart';

class UpdateCurrentUserUseCase {
  UserRepository userRepository;

  UpdateCurrentUserUseCase({
    required this.userRepository,
  });

  Future<bool> call(BuildContext context, FormData formData) async {
    return await userRepository.updateCurrentUserData(context, formData);
  }
}
