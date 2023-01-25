import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/repository/specific_ad_repository.dart';

class SendCommentUseCase {
  SpecificAdRepository specificAdRepository;

  SendCommentUseCase({
    required this.specificAdRepository,
  });

  Future<CommentsEntity> call(
      BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRepository.sendCommentMethod(context, body);
  }
}
