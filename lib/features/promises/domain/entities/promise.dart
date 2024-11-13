class Promise {
  final int id;
  final String name;
  final DateTime promiseDate;
  final String location;
  final String status;
  final String organizerName;
  final String? organizerProfileImageUrl;

  Promise({
    required this.id,
    required this.name,
    required this.promiseDate,
    required this.location,
    required this.status,
    required this.organizerName,
    this.organizerProfileImageUrl,
  });
}
