class Age {
  Age({
    this.id,
    this.groupName,
  });

  int? id;
  String? groupName;

  factory Age.fromJson(Map<String, dynamic> json) => Age(
    id: json["id"],
    groupName: json["group_name"] == null ? null : json["group_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "group_name": groupName == null ? null : groupName,
  };
}