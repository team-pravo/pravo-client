class PromiseModel {
  final int id;
  final String name;
  final DateTime scheduledAt;
  final String location;
  final String status;
  final String organizerName;
  final String? organizerProfileImageUrl;

  PromiseModel({
    required this.id,
    required this.name,
    required this.scheduledAt,
    required this.location,
    required this.status,
    required this.organizerName,
    this.organizerProfileImageUrl,
  });

  factory PromiseModel.fromJson(Map<String, dynamic> json) {
    return PromiseModel(
      id: json['id'],
      name: json['name'],
      scheduledAt: DateTime.parse(json['scheduledAt']),
      location: json['location'],
      status: json['status'],
      organizerName: json['organizerName'],
      organizerProfileImageUrl: json['organizerProfileImageUrl'],
    );
  }
}
