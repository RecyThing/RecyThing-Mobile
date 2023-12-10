class HistoryPoinModel {
  String idTransaction;
  String createdAt;
  int point;
  String? timeTransaction;
  String? typeTransaction;

  HistoryPoinModel(
      {required this.idTransaction,
      required this.createdAt,
      required this.point,
      this.timeTransaction,
      this.typeTransaction});

  factory HistoryPoinModel.fromJson(Map<String, dynamic> json) =>
      HistoryPoinModel(
          idTransaction: json["id_transaction"],
          createdAt: json["created_at"],
          point: json["point"],
          timeTransaction: json["time_transaction"],
          typeTransaction: json["type_transaction"]);
}
