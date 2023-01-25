class Country {
  Country({
    required this.id,
    required this.key,
    required this.text,
    required this.image,
     this.countrySelected=false
  });

 late int id;
 late String key;
 late String text;
 late  String image;
 late bool countrySelected;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    key: json["key"],
    text: json["text"],
    image: json["image"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key":key,
    "text": text,
    "image": image,
  };
}