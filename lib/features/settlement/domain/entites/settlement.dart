class Settlement {
  final int id;
  final String name;
  final int deposit;
  final int earnedPoint;
  final int attendanceCount;
  final int absentCount;

  Settlement({
    required this.id,
    required this.name,
    required this.deposit,
    required this.earnedPoint,
    required this.attendanceCount,
    required this.absentCount,
  });
}
