import 'package:flutter/material.dart';

abstract class FavoriteAdRepository {
  Future<bool> addingAdTOFavoriteAdList(
      BuildContext context, Map<String, dynamic> body);

  Future<bool> deletingAdFromFavoriteAdList(
      BuildContext context, Map<String, dynamic> body);
}
