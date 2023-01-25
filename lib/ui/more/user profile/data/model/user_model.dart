import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {int? id,
      String? name,
      String? email,
      String? phone,
      String? type,
      int? reviewsCount,
      Null? reviewsAvg,
      int? commentsCount,
      String? avatar,
      String? localedType,
      String? createdAt,
      String? createdAtFormatted,
      int? followersCount,
      int? followingCount,
      int? adsCount,
      bool? followed})
      : super(
            id: id,
            name: name,
            email: email,
            phone: phone,
            type: type,
            reviewsCount: reviewsCount,
            reviewsAvg: reviewsAvg,
            commentsCount: commentsCount,
            avatar: avatar,
            localedType: localedType,
            createdAt: createdAt,
            createdAtFormatted: createdAtFormatted,
            followersCount: followersCount,
            followingCount: followingCount,
            adsCount: adsCount,
            followed: followed);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      type: json['type'],
      reviewsCount: json['reviews_count'],
      reviewsAvg: json['reviews_avg'],
      commentsCount: json['comments_count'],
      avatar: json['avatar'],
      localedType: json['localed_type'],
      createdAt: json['created_at'],
      createdAtFormatted: json['created_at_formatted'],
      followersCount: json['followers_count'],
      followingCount: json['following_count'],
      adsCount: json['ads_count'],
      followed: json['followed'],
    );
  }
}
