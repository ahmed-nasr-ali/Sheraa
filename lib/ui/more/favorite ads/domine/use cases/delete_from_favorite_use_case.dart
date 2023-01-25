import 'package:flutter/material.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/repository/favorite_ad_repository.dart';

class DeleteAdFromFavoriteAdListUseCase {
  FavoriteAdRepository favoriteAdRepository;

  DeleteAdFromFavoriteAdListUseCase({
    required this.favoriteAdRepository,
  });

  Future<bool> call(BuildContext context, Map<String, dynamic> body) async {
    return await favoriteAdRepository.deletingAdFromFavoriteAdList(
        context, body);
  }
}
