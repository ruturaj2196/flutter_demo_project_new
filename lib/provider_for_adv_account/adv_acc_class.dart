class ShadowAccountClass {
  String? id;
  String? name;

  ShadowAccountClass({
    this.id,
    this.name,
  });

  factory ShadowAccountClass.fromJson(Map<String, dynamic> json) =>
      ShadowAccountClass(
        id: json["id"],
        name: json["name"],
      );
}
