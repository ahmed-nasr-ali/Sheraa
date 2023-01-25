import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/use%20cases/add_to_favorite_use_case.dart';

class AddingAdToFavoriteAdListProvider extends ChangeNotifier {
  AddingAdToFavoriteAdListUseCase addingAdToFavoriteAdListUseCase;

  AddingAdToFavoriteAdListProvider({
    required this.addingAdToFavoriteAdListUseCase,
  });

  Future<bool> addingAdToFavoriteAdList(
      BuildContext context, Map<String, dynamic> body) async {
    return await addingAdToFavoriteAdListUseCase.call(context, body);
  }
}
