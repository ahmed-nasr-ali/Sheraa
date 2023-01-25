class UserEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  int? reviewsCount;
  Null? reviewsAvg;
  int? commentsCount;
  String? avatar;
  String? localedType;
  String? createdAt;
  String? createdAtFormatted;
  int? followersCount;
  int? followingCount;
  int? adsCount;
  bool? followed;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.reviewsCount,
    this.reviewsAvg,
    this.commentsCount,
    this.avatar,
    this.localedType,
    this.createdAt,
    this.createdAtFormatted,
    this.followersCount,
    this.followingCount,
    this.adsCount,
    this.followed,
  });
}
