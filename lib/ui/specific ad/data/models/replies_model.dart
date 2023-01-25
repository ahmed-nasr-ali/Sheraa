import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';

class RepliesModel extends RepliesEntity {
  RepliesModel({
    int? id,
    int? commentId,
    String? replay,
    String? userName,
    String? userEmail,
    String? userAvatar,
    String? createdAt,
  }) : super(
            id: id,
            commentId: commentId,
            replay: replay,
            userName: userName,
            userEmail: userEmail,
            userAvatar: userAvatar,
            createdAt: createdAt);

  factory RepliesModel.fromJson(Map<String, dynamic> json) {
    return RepliesModel(
      id: json['id'],
      commentId: json['comment_id'],
      replay: json['replay'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      userAvatar: json['user_avatar'],
      createdAt: json['created_at'],
    );
  }
}
