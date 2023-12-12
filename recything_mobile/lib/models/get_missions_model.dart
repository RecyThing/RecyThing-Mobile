class GetMissionsModel {
  bool? status;
  String? message;
  List<Data>? data;

  GetMissionsModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetMissionsModel.fromJson(Map<String, dynamic> json) =>
      GetMissionsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  String? missionId;
  String? claimedId;
  String? title;
  StatusMission? statusMission;
  String? missionImage;
  Reason? reason;
  int? point;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  String? titleStage;
  String? descriptionStage;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? transactionId;
  String? statusApproval;

  Data({
    this.missionId,
    this.claimedId,
    this.title,
    this.statusMission,
    this.missionImage,
    this.reason,
    this.point,
    this.description,
    this.startDate,
    this.endDate,
    this.titleStage,
    this.descriptionStage,
    this.createdAt,
    this.updatedAt,
    this.transactionId,
    this.statusApproval,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        missionId: json["mission_id"],
        claimedId: json["claimed_id"],
        title: json["title"],
        statusMission: statusMissionValues.map[json["status_mission"]]!,
        missionImage: json["mission_image"],
        reason: reasonValues.map[json["reason"]]!,
        point: json["point"],
        description: json["description"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        titleStage: json["title_stage"],
        descriptionStage: json["description_stage"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        transactionId: json["transaction_id"],
        statusApproval: json["status_approval"],
      );

  Map<String, dynamic> toJson() => {
        "mission_id": missionId,
        "claimed_id": claimedId,
        "title": title,
        "status_mission": statusMissionValues.reverse[statusMission],
        "mission_image": missionImage,
        "reason": reasonValues.reverse[reason],
        "point": point,
        "description": description,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "title_stage": titleStage,
        "description_stage": descriptionStage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "transaction_id": transactionId,
        "status_approval": statusApproval,
      };
}

enum Reason { MENUNGGU_VERIFIKASI, UPLOAD_BUKTI_PENGERJAAN }

final reasonValues = EnumValues({
  "menunggu verifikasi": Reason.MENUNGGU_VERIFIKASI,
  "upload bukti pengerjaan": Reason.UPLOAD_BUKTI_PENGERJAAN
});

enum StatusMission { AKTIF, MELEWATI_TENGGAT }

final statusMissionValues = EnumValues({
  "Aktif": StatusMission.AKTIF,
  "Melewati Tenggat": StatusMission.MELEWATI_TENGGAT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
