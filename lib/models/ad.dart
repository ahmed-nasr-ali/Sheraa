class Ad {
  int? id;
  String? name;
  String? description;
  String? price;
  int? views;
  String? type;
  List<String>? image;
  List<SingleSelection>? singleSelection;
  List<MultiSelection>? multiSelection;
  Category? category;
  Country? country;
  City? city;
  Area? area;
  User? user;
  bool? hideContacts;
  bool? disableComments;
  List<Comments>? comments;
  String? createdAt;
  String? activeFrom;
  int? endedIn;
  bool? isFavorite;
  int? commentsCount;

  Ad(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.views,
      this.type,
      this.image,
      this.singleSelection,
      this.multiSelection,
      this.category,
      this.country,
      this.city,
      this.area,
      this.user,
      this.hideContacts,
      this.disableComments,
      this.comments,
      this.createdAt,
      this.activeFrom,
      this.endedIn,
      this.isFavorite,
      this.commentsCount});

  Ad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    views = json['views'];
    type = json['type'];
    image = json['image'].cast<String>();
    if (json['single_selection'] != null) {
      singleSelection = <SingleSelection>[];
      json['single_selection'].forEach((v) {
        singleSelection!.add(new SingleSelection.fromJson(v));
      });
    }
    if (json['multi_selection'] != null) {
      multiSelection = <MultiSelection>[];
      json['multi_selection'].forEach((v) {
        multiSelection!.add(new MultiSelection.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] == null ? null : City.fromJson(json['city']);
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    hideContacts = json['hide_contacts'];
    disableComments = json['disable_comments'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    activeFrom = json['active_from'];
    endedIn = json['ended_in'];
    isFavorite = json['is_favorite'];
    commentsCount = json['comments_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['views'] = this.views;
    data['type'] = this.type;
    data['image'] = this.image;
    if (this.singleSelection != null) {
      data['single_selection'] =
          this.singleSelection!.map((v) => v.toJson()).toList();
    }
    if (this.multiSelection != null) {
      data['multi_selection'] =
          this.multiSelection!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    // data['city'] = this.city;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['hide_contacts'] = this.hideContacts;
    data['disable_comments'] = this.disableComments;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['active_from'] = this.activeFrom;
    data['ended_in'] = this.endedIn;
    data['is_favorite'] = this.isFavorite;
    data['comments_count'] = this.commentsCount;
    return data;
  }
}

class SingleSelection {
  int? optionId;
  String? optionName;
  int? featureId;
  String? featureName;

  SingleSelection(
      {this.optionId, this.optionName, this.featureId, this.featureName});

  SingleSelection.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    optionName = json['option_name'];
    featureId = json['feature_id'];
    featureName = json['feature_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_id'] = this.optionId;
    data['option_name'] = this.optionName;
    data['feature_id'] = this.featureId;
    data['feature_name'] = this.featureName;
    return data;
  }
}

class MultiSelection {
  int? optionId;
  String? optionName;
  int? featureId;
  String? featureName;

  MultiSelection(
      {this.optionId, this.optionName, this.featureId, this.featureName});

  MultiSelection.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    optionName = json['option_name'];
    featureId = json['feature_id'];
    featureName = json['feature_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_id'] = this.optionId;
    data['option_name'] = this.optionName;
    data['feature_id'] = this.featureId;
    data['feature_name'] = this.featureName;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  List<Subcategories>? subcategories;

  Category({this.id, this.name, this.subcategories});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  int? id;
  String? name;
  String? image;

  Subcategories({this.id, this.name, this.image});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? code;
  String? key;
  bool? isDefault;
  dynamic currency;
  String? flag;

  Country(
      {this.id,
      this.name,
      this.code,
      this.key,
      this.isDefault,
      this.currency,
      this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    key = json['key'];
    isDefault = json['is_default'];
    currency = json['currency'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['key'] = this.key;
    data['is_default'] = this.isDefault;
    data['currency'] = this.currency;
    data['flag'] = this.flag;
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Area {
  int? id;
  String? name;

  Area({this.id, this.name});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  String? deviceToken;
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

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.deviceToken,
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    deviceToken = json['device_token'];
    reviewsCount = json['reviews_count'];
    reviewsAvg = json['reviews_avg'];
    commentsCount = json['comments_count'];
    avatar = json['avatar'];
    localedType = json['localed_type'];
    createdAt = json['created_at'];
    createdAtFormatted = json['created_at_formatted'];
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
    data['device_token'] = this.deviceToken;
    data['reviews_count'] = this.reviewsCount;
    data['reviews_avg'] = this.reviewsAvg;
    data['comments_count'] = this.commentsCount;
    data['avatar'] = this.avatar;
    data['localed_type'] = this.localedType;
    data['created_at'] = this.createdAt;
    data['created_at_formatted'] = this.createdAtFormatted;
    data['followers_count'] = this.followersCount;
    data['following_count'] = this.followingCount;
    data['ads_count'] = this.adsCount;
    data['followed'] = this.followed;
    return data;
  }
}

class Comments {
  int? id;
  String? comment;
  String? userName;
  String? userType;
  String? userEmail;
  String? userAvatar;
  String? createdAt;
  List<Replies>? replies;

  Comments(
      {this.id,
      this.comment,
      this.userName,
      this.userType,
      this.userEmail,
      this.userAvatar,
      this.createdAt,
      this.replies});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userName = json['user_name'];
    userType = json['user_type'];
    userEmail = json['user_email'];
    userAvatar = json['user_avatar'];
    createdAt = json['created_at'];
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['user_name'] = this.userName;
    data['user_type'] = this.userType;
    data['user_email'] = this.userEmail;
    data['user_avatar'] = this.userAvatar;
    data['created_at'] = this.createdAt;
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Replies {
  int? id;
  int? commentId;
  String? replay;
  String? userName;
  String? userEmail;
  String? userAvatar;
  String? createdAt;

  Replies(
      {this.id,
      this.commentId,
      this.replay,
      this.userName,
      this.userEmail,
      this.userAvatar,
      this.createdAt});

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commentId = json['comment_id'];
    replay = json['replay'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userAvatar = json['user_avatar'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment_id'] = this.commentId;
    data['replay'] = this.replay;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_avatar'] = this.userAvatar;
    data['created_at'] = this.createdAt;
    return data;
  }
}
