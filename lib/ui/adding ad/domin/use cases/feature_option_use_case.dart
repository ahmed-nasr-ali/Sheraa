import 'package:flutter/material.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_options_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class FeatureOptionUseCase {
  AddingAdRepository addingAdRepository;

  FeatureOptionUseCase({
    required this.addingAdRepository,
  });

  Future<List<FeatureOptionEntity>> call(
      BuildContext context, int pageNumber, int featureId) async {
    return await addingAdRepository.getFeatureOptionList(
        context, pageNumber, featureId);
  }
}
