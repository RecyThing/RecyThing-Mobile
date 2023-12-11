class GetMissionsModel {
  bool status;
  String message;
  List<Data> data;

  GetMissionsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetMissionsModel.fromJson(Map<String, dynamic> json) =>
      GetMissionsModel(
        status: json["status"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  String missionId;
  String title;
  String statusMission;
  String missionImage;
  int point;
  String description;
  DateTime startDate;
  DateTime endDate;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.missionId,
    required this.title,
    required this.statusMission,
    required this.missionImage,
    required this.point,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        missionId: json["mission_id"],
        title: json["title"],
        statusMission: json["status_mission"],
        missionImage: json["mission_image"],
        point: json["point"],
        description: json["description"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "mission_id": missionId,
        "title": title,
        "status_mission": statusMission,
        "mission_image": missionImage,
        "point": point,
        "description": description,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
