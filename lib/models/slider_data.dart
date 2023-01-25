import 'dart:convert';

SliderSData sliderSDataFromJson(String str) => SliderSData.fromJson(json.decode(str));

String sliderSDataToJson(SliderSData data) => json.encode(data.toJson());

class SliderSData {
  SliderSData({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Slider> data;
  Links links;
  Meta meta;

  factory SliderSData.fromJson(Map<String, dynamic> json) => SliderSData(
    data: List<Slider>.from(json["data"].map((x) => Slider.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Slider {
  Slider({
    required this.id,
    required this.name,
    required this.url,
    required this.image,
  });

  int id;
  String name;
  String url;
  String image;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "image": image,
  };
}

class Links {
  Links({
    required this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  dynamic last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.path,
    required this.perPage,
    required this.to,
  });

  int currentPage;
  int from;
  String path;
  int perPage;
  int to;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "path": path,
    "per_page": perPage,
    "to": to,
  };
}
