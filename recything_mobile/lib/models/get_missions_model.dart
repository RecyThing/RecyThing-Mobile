class GetMissionsModel {
  bool status;
  String message;
  List<Data> data;
  Pagination pagination;
  Count count;

  GetMissionsModel({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
    required this.count,
  });

  factory GetMissionsModel.fromJson(Map<String, dynamic> json) =>
      GetMissionsModel(
        status: json["status"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
        count: Count.fromJson(json["count"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
        "count": count.toJson(),
      };
}

class Count {
  int totalCount;
  int countActive;
  int countExpired;

  Count({
    required this.totalCount,
    required this.countActive,
    required this.countExpired,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
        totalCount: json["total_count"],
        countActive: json["count_active"],
        countExpired: json["count_expired"],
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "count_active": countActive,
        "count_expired": countExpired,
      };
}

class Data {
  String id;
  String name;
  String creator;
  String status;
  String missionImage;
  int point;
  String description;
  DateTime startDate;
  DateTime endDate;
  List<dynamic> missionStages;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.creator,
    required this.status,
    required this.missionImage,
    required this.point,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.missionStages,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        creator: json["creator"],
        status: json["status"],
        missionImage: json["mission_image"],
        point: json["point"],
        description: json["description"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        missionStages: List<dynamic>.from(json["mission_stages"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "creator": creator,
        "status": status,
        "mission_image": missionImage,
        "point": point,
        "description": description,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "mission_stages": List<dynamic>.from(missionStages.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Pagination {
  int limit;
  int currentPage;
  int lastPage;

  Pagination({
    required this.limit,
    required this.currentPage,
    required this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "current_page": currentPage,
        "last_page": lastPage,
      };
}
