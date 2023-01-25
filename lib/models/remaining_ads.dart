class RemainingAd {
  int? mySpecialAdsRemain;
  int? myVipAdsRemain;

  RemainingAd({this.mySpecialAdsRemain, this.myVipAdsRemain});

  RemainingAd.fromJson(Map<String, dynamic> json) {
    mySpecialAdsRemain = json['mySpecialAdsRemain'];
    myVipAdsRemain = json['myVipAdsRemain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mySpecialAdsRemain'] = this.mySpecialAdsRemain;
    data['myVipAdsRemain'] = this.myVipAdsRemain;
    return data;
  }
}
