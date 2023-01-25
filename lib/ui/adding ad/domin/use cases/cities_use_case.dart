import 'package:flutter/material.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/cities_entities.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class CitiesUseCase {
  AddingAdRepository addingAdRepository;

  CitiesUseCase({
    required this.addingAdRepository,
  });

  Future<List<CitiesEntity>> call(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    return await addingAdRepository.getCitiesList(
        context, pageNumber, isSearching, searchingText);
  }
}
