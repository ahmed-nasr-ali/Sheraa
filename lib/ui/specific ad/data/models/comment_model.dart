import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';

import 'replies_model.dart';

class CommentsModel extends CommentsEntity {
  CommentsModel(
      {int? id,
      String? comment,
      String? userName,
      String? userType,
      String? userEmail,
      String? userAvatar,
      String? createdAt,
      List<RepliesEntity>? replies})
      : super(
            id: id,
            comment: comment,
            userName: userName,
            userType: userType,
            userEmail: userEmail,
            userAvatar: userAvatar,
            createdAt: createdAt,
            replies: replies);

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    List<RepliesModel> replies = <RepliesModel>[];

    if (json['replies'] != null) {
      json['replies'].forEach((v) {
        replies.add(RepliesModel.fromJson(v));
      });
    }
    return CommentsModel(
      id: json['id'],
      comment: json['comment'],
      userName: json['user_name'],
      userType: json['user_type'],
      userEmail: json['user_email'],
      userAvatar: json['user_avatar'],
      createdAt: json['created_at'],
      replies: replies,
    );
  }
}
