import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/main_category_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class MainCategoryUseCase {
  AddingAdRepository addingAdRepository;

  MainCategoryUseCase({
    required this.addingAdRepository,
  });

  Future<List<MainCategoryEntity>> call(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    return await addingAdRepository.getMainCategoryList(
        context, pageNumber, isSearching, searchingText);
  }
}
