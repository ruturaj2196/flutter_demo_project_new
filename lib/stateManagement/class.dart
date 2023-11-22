class Subscribers {
  int? id;
  String? emailaddress;

  Subscribers({
    this.id,
    this.emailaddress,
  });

  factory Subscribers.fromJson(Map<String, dynamic> json) => Subscribers(
        id: json["id"],
        emailaddress: json["emailaddress"],
      );
}
