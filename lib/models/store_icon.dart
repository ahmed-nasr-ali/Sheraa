class StoreIcon {
  StoreIcon({
    required this.id,
    required this.store,
    required this.icon,
  });

  int id;
  String store;
  String icon;

  factory StoreIcon.fromJson(Map<String, dynamic> json) => StoreIcon(
    id: json["id"],
    store: json["store"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store": store,
    "icon": icon,
  };
}





