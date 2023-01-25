import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/repository/specific_ad_repository.dart';

class SendReplyCommentUseCase {
  SpecificAdRepository specificAdRepository;

  SendReplyCommentUseCase({
    required this.specificAdRepository,
  });

  Future<RepliesEntity> call(
      BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRepository.sendReplyComment(context, body);
  }
}
