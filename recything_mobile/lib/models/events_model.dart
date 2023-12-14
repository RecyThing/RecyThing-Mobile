class EventsModel {
  String? id;
  String? communityId;
  String? title;
  int? quota;
  String? date;
  String? status;
  String? image;

  EventsModel({
    this.id,
    this.communityId,
    this.title,
    this.quota,
    this.date,
    this.status,
    this.image,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["id"],
        communityId: json["communityId"],
        title: json["title"],
        quota: json["quota"],
        date: json["date"],
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "communityId": communityId,
        "title": title,
        "quota": quota,
        "date": date,
        "status": status,
        "image": image,
      };
}
