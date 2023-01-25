import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/get_current_user_provider.dart';

class GetCurrentUserDataController {
  static Future<UserEntity> fetchCurrentUserData(BuildContext context) async {
    return await Provider.of<GetCurrentUserDataProvider>(context, listen: false)
        .getCurrentUserData(context);
  }
}
