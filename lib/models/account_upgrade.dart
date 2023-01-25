class AccountUpgradeModel {
  int? id;
  String? title;
  String? type;
  List<Packages>? packages;

  AccountUpgradeModel({this.id, this.title, this.type, this.packages});

  AccountUpgradeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  String? title;
  String? duration;
  String? price;
  String? vipNo;
  String? specialNo;
  String? promotionId;

  Packages(
      {this.id,
      this.title,
      this.duration,
      this.price,
      this.vipNo,
      this.specialNo,
      this.promotionId});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    price = json['price'];
    vipNo = json['vip_no'];
    specialNo = json['special_no'];
    promotionId = json['promotion_id '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['vip_no'] = this.vipNo;
    data['special_no'] = this.specialNo;
    data['promotion_id '] = this.promotionId;
    return data;
  }
}