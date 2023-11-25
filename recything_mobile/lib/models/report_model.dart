class ReportModel {
  String id;
  String reportType;
  num? longitude;
  num? latitude;
  String location;
  String? desc;
  String? addressPoint;
  String status;
  String? scaleType;
  String? insidentDate;
  String? insidentTime;
  String? trashType;
  DateTime createAt;
  DateTime updateAt;

  ReportModel(
      {required this.id,
      required this.reportType,
      required this.longitude,
      required this.latitude,
      required this.location,
      required this.desc,
      required this.addressPoint,
      required this.status,
      this.scaleType,
      this.insidentDate,
      this.insidentTime,
      this.trashType,
      required this.createAt,
      required this.updateAt});
  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
      id: json["Id"] ?? "",
      reportType: json["report_type"] ?? "",
      longitude: json["longitude"],
      latitude: json["latitude"],
      location: json["location"],
      desc: json["desc"],
      addressPoint: json["address_point"],
      status: json["status"],
      scaleType: json["scale_type"],
      insidentDate: json["insident_date"],
      insidentTime: json["insident_time"],
      trashType: json["trash_type"],
      createAt: DateTime.parse(json["created_at"]),
      updateAt: DateTime.parse(json["updated_at"]));
  Map<String, dynamic> toJson() => {
        "Id": id,
        "report_type": reportType,
        "longitude": longitude,
        "latitude": latitude,
        "location": location,
        "description": desc,
        "address_point": addressPoint,
        "status": status,
        "scale_type": scaleType,
        "insident_date": insidentDate,
        "insident_time": insidentTime,
      };
}
