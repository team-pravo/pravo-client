class SettlementResponseModel {
  final int id;
  final String name;
  final int deposit;
  final int earnedPoint;
  final int attendanceCount;
  final int absentCount;

  SettlementResponseModel({
    required this.id,
    required this.name,
    required this.deposit,
    required this.earnedPoint,
    required this.attendanceCount,
    required this.absentCount,
  });

  factory SettlementResponseModel.fromJson(Map<String, dynamic> json) {
    return SettlementResponseModel(
      id: json['id'],
      name: json['name'],
      deposit: json['deposit'],
      earnedPoint: json['earnedPoint'],
      attendanceCount: json['attendanceCount'],
      absentCount: json['absentCount'],
    );
  }
}
