import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/domin/use%20case/get_current_user_data.dart';

class GetCurrentUserDataProvider extends ChangeNotifier {
  GetCurrentUserDataUseCase getCurrentUserDataUseCase;

  GetCurrentUserDataProvider({
    required this.getCurrentUserDataUseCase,
  });

  Future<UserEntity> getCurrentUserData(BuildContext context) async {
    return await getCurrentUserDataUseCase.call(context);
  }
}
