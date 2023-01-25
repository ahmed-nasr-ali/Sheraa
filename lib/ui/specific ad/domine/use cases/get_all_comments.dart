import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/repository/specific_ad_repository.dart';

class GetAllCommentsUseCase {
  SpecificAdRepository specificAdRepository;

  GetAllCommentsUseCase({
    required this.specificAdRepository,
  });

  Future<List<CommentsEntity>> call(
      BuildContext context, String adId, int pageNumber) async {
    return await specificAdRepository.getAllCommentsMethod(
        context, adId, pageNumber);
  }
}
