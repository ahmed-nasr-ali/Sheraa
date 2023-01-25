import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/repository/favorite_ad_repository.dart';

class AddingAdToFavoriteAdListUseCase {
  FavoriteAdRepository favoriteAdRepository;

  AddingAdToFavoriteAdListUseCase({
    required this.favoriteAdRepository,
  });

  Future<bool> call(BuildContext context, Map<String, dynamic> body) async {
    return await favoriteAdRepository.addingAdTOFavoriteAdList(context, body);
  }
}
