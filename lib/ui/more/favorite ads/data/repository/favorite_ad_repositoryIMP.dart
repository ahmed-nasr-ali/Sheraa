import 'package:flutter/src/widgets/framework.dart';

import 'package:sheraa/ui/more/favorite%20ads/data/data%20sources/favorite_ad_remote_data_source.dart';
import 'package:sheraa/ui/more/favorite%20ads/domine/repository/favorite_ad_repository.dart';

class FavoriteAdRepositoryIMP implements FavoriteAdRepository {
  FavoriteAdRemoteDataSource favoriteAdRemoteDataSource;

  FavoriteAdRepositoryIMP({
    required this.favoriteAdRemoteDataSource,
  });
  @override
  Future<bool> addingAdTOFavoriteAdList(
      BuildContext context, Map<String, dynamic> body) async {
    return await favoriteAdRemoteDataSource.addingAdToFavoriteAdList(
        context, body);
  }

  @override
  Future<bool> deletingAdFromFavoriteAdList(
      BuildContext context, Map<String, dynamic> body) async {
    return await favoriteAdRemoteDataSource.deletingAdFromFavoriteAdList(
        context, body);
  }
}
