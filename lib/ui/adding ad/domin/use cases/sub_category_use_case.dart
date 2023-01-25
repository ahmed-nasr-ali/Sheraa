import 'package:flutter/material.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/sub_category_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class SubCategoryUseCase {
  AddingAdRepository addingAdRepository;

  SubCategoryUseCase({
    required this.addingAdRepository,
  });

  Future<List<SubCategoryEntity>> call(int mainCategoryId, BuildContext context,
      int pageNumber, bool isSearching, String searchingText) async {
    return await addingAdRepository.getSubCategoryList(
        mainCategoryId, context, pageNumber, isSearching, searchingText);
  }
}
