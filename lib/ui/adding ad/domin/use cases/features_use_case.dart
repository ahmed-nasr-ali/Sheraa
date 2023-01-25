import 'package:flutter/material.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class FeatureUseCase {
  AddingAdRepository addingAdRepository;

  FeatureUseCase({
    required this.addingAdRepository,
  });

  Future<List<FeatureEntity>> call(
      BuildContext context, int pageNumber, int categoryId) async {
    return await addingAdRepository.getFeatureList(
        context, pageNumber, categoryId);
  }
}
