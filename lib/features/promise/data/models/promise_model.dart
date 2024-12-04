import 'package:pravo_client/features/promise/data/models/participant_model.dart';

class PromiseModel {
  final int id;
  final String name;
  final DateTime scheduledAt;
  final String location;
  final String status;
  final int deposit;
  final List<ParticipantModel> participants;

  PromiseModel({
    required this.id,
    required this.name,
    required this.scheduledAt,
    required this.location,
    required this.status,
    required this.deposit,
    required this.participants,
  });

  factory PromiseModel.fromJson(Map<String, dynamic> json) {
    return PromiseModel(
      id: json['id'],
      name: json['name'],
      scheduledAt: DateTime.parse(json['scheduledAt']),
      location: json['location'],
      status: json['status'],
      deposit: json['deposit'],
      participants: (json['participants'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((participant) => ParticipantModel.fromJson(participant))
          .toList(),
    );
  }
}
