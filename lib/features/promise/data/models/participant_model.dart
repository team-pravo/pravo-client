class ParticipantModel {
  final int id;
  final String name;
  final String? profileImageUrl;
  final String status;
  final String role;

  ParticipantModel({
    required this.id,
    required this.name,
    this.profileImageUrl,
    required this.status,
    required this.role,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      status: json['status'],
      role: json['role'],
    );
  }
}
