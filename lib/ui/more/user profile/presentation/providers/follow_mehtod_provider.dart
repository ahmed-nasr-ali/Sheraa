import 'package:flutter/material.dart';

import 'package:sheraa/ui/more/user%20profile/domin/use%20case/follow_method_use_case.dart';

class FollowMehodProvider extends ChangeNotifier {
  FollowMethodUseCase followMethodUseCase;

  FollowMehodProvider({
    required this.followMethodUseCase,
  });

  Future<bool> followMethod(BuildContext context, int userId) async {
    return await followMethodUseCase.call(context, userId);
  }
}
