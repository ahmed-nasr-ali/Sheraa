import 'package:flutter/material.dart';

import 'package:sheraa/ui/specific%20ad/data/data%20source/specific_ad_remote_data_source.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/repository/specific_ad_repository.dart';

class SpecificAdRepositoryIMP implements SpecificAdRepository {
  SpecificAdRemoteDataSource specificAdRemoteDataSource;

  SpecificAdRepositoryIMP({
    required this.specificAdRemoteDataSource,
  });
  @override
  Future<bool> tellMeWhenPriceDecrease(
      BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRemoteDataSource.tellMeWhenPriceDecrease(
        context, body);
  }

  @override
  Future<bool> reportAd(BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRemoteDataSource.reportAd(context, body);
  }

  @override
  Future<CommentsEntity> sendCommentMethod(
      BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRemoteDataSource.sendComment(context, body);
  }

  @override
  Future<List<CommentsEntity>> getAllCommentsMethod(
      BuildContext context, String adId, int pageNumber) async {
    return await specificAdRemoteDataSource.getAllComments(
        context, adId, pageNumber);
  }

  @override
  Future<bool> reportComment(
      BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRemoteDataSource.reportCommentMethod(context, body);
  }

  @override
  Future<RepliesEntity> sendReplyComment(
      BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRemoteDataSource.sendRelpyComment(context, body);
  }
}
