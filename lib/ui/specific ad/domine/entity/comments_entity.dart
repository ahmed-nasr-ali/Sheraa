import 'replies_entity.dart';

class CommentsEntity {
  int? id;
  String? comment;
  String? userName;
  String? userType;
  String? userEmail;
  String? userAvatar;
  String? createdAt;
  List<RepliesEntity>? replies;

  CommentsEntity({
    this.id,
    this.comment,
    this.userName,
    this.userType,
    this.userEmail,
    this.userAvatar,
    this.createdAt,
    this.replies,
  });
}
