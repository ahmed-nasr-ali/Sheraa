class AuthUser {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? deviceToken;
  String? type;
  int? reviewsCount;
  dynamic? reviewsAvg;
  int? commentsCount;
 // List<dynamic>? latestComments;
  String? avatar;
  String? localedType;
  String? createdAt;
  String? createdAtFormatted;
  int? followersCount;
  int? followingCount;
  int? adsCount;
  bool? followed;
  AuthUser(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.type,
        this.reviewsCount,
        this.reviewsAvg,
        this.commentsCount,
        //this.latestComments,
        this.avatar,
        this.localedType,
        this.createdAt,
        this.createdAtFormatted,
      this.deviceToken,
      this.adsCount,
      this.followed,
      this.followersCount,
      this.followingCount});

  AuthUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    reviewsCount = json['reviews_count'];
    reviewsAvg = json['reviews_avg'];
    commentsCount = json['comments_count'];
  //  latestComments =json["latest_comments"]==null?null:  List<dynamic>.from(json["latest_comments"].map((x) => x));

    avatar = json['avatar'];
    localedType = json['localed_type'];
    createdAt = json['created_at'];
    createdAtFormatted = json['created_at_formatted'];
    deviceToken=json['device_token'];
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    adsCount = json['ads_count'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['reviews_count'] = this.reviewsCount;
    data['reviews_avg'] = this.reviewsAvg;
    data['comments_count'] = this.commentsCount;
    // if (this.latestComments != null) {
    //   data['latest_comments'] =
    //       this.latestComments!.map((v) => v.toJson()).toList();
    // }
    data['avatar'] = this.avatar;
    data['localed_type'] = this.localedType;
    data['created_at'] = this.createdAt;
    data['created_at_formatted'] = this.createdAtFormatted;
    data['device_token']=this.deviceToken;
    data['followers_count'] = this.followersCount;
    data['following_count'] = this.followingCount;
    data['ads_count'] = this.adsCount;
    data['followed'] = this.followed;
    return data;
  }
}