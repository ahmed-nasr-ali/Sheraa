import 'package:flutter/material.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/use%20cases/delete_from_favorite_use_case.dart';

class DeletingAdFromFavoriteAdListProvider extends ChangeNotifier {
  DeleteAdFromFavoriteAdListUseCase deleteAdFromFavoriteAdListUseCase;

  DeletingAdFromFavoriteAdListProvider({
    required this.deleteAdFromFavoriteAdListUseCase,
  });

  Future<bool> deletingAdFromFavoriteAdList(
      BuildContext context, Map<String, dynamic> body) async {
    return await deleteAdFromFavoriteAdListUseCase.call(context, body);
  }
}
