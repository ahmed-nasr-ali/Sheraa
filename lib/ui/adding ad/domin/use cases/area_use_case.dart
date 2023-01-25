import 'package:flutter/material.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/area_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class AreaUseCase {
  AddingAdRepository addingAdRepository;

  AreaUseCase({
    required this.addingAdRepository,
  });

  Future<List<AreaEntity>> call(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    return await addingAdRepository.getAreasList(
        context, pageNumber, isSearching, searchingText);
  }
}
