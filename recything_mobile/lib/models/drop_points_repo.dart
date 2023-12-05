class DropPointsModel {
  String id;
  String name;
  String address;
  List<ScheduleModel>? scheduleModel;

  DropPointsModel(
      {required this.id,
      required this.name,
      required this.address,
      this.scheduleModel});

  factory DropPointsModel.fromJson(Map<String, dynamic> json) =>
      DropPointsModel(
          id: json["id"] ?? "",
          name: json["name"],
          address: json["address"],
          scheduleModel: json["schedule"] == null
              ? []
              : List<ScheduleModel>.from(
                  json["schedule"]!.map((x) => ScheduleModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "schedul": scheduleModel == null
            ? []
            : List<dynamic>.from(scheduleModel!.map((x) => x.toJson()))
      };
}

class ScheduleModel {
  String day;
  String openTime;
  String closeTime;
  bool closed;

  ScheduleModel(
      {required this.day,
      required this.openTime,
      required this.closeTime,
      required this.closed});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
      day: json["day"] ?? " ",
      openTime: json["open_time"] ?? " ",
      closeTime: json["closeTime"] ?? " ",
      closed: json["close"] ?? false);

  Map<String, dynamic> toJson() => {
        "day": day,
        "open_time": openTime,
        "close_time": closeTime,
        "closed": closed
      };
}
