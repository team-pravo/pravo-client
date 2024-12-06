class PointLogModel {
  final String promiseName;
  final String pointLogStatus;
  final int pointAmount;
  final DateTime pointDate;

  PointLogModel({
    required this.promiseName,
    required this.pointLogStatus,
    required this.pointAmount,
    required this.pointDate,
  });

  factory PointLogModel.fromJson(Map<String, dynamic> json) {
    return PointLogModel(
      promiseName: json['promiseName'],
      pointLogStatus: json['pointLogStatus'],
      pointAmount: json['pointAmount'],
      pointDate: DateTime.parse(json['pointDate']),
    );
  }
}
