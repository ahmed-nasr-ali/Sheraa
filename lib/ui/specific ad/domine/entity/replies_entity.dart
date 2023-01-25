class RepliesEntity {
  int? id;
  int? commentId;
  String? replay;
  String? userName;
  String? userEmail;
  String? userAvatar;
  String? createdAt;

  RepliesEntity({
    this.id,
    this.commentId,
    this.replay,
    this.userName,
    this.userEmail,
    this.userAvatar,
    this.createdAt,
  });
}
