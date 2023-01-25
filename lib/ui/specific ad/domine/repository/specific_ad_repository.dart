import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';

abstract class SpecificAdRepository {
  Future<bool> tellMeWhenPriceDecrease(
      BuildContext context, Map<String, dynamic> body);

  Future<bool> reportAd(BuildContext context, Map<String, dynamic> body);

  Future<CommentsEntity> sendCommentMethod(
      BuildContext context, Map<String, dynamic> body);

  Future<List<CommentsEntity>> getAllCommentsMethod(
      BuildContext context, String adId, int pageNumber);

  Future<bool> reportComment(BuildContext context, Map<String, dynamic> body);

  Future<RepliesEntity> sendReplyComment(
      BuildContext context, Map<String, dynamic> body);
}
