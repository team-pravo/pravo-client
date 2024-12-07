class SettlementRequestModel {
  final List<int> memberIds;
  final int promiseId;

  SettlementRequestModel({required this.memberIds, required this.promiseId});

  Map<String, dynamic> toJson() {
    return {
      'memberIds': memberIds,
      'promiseId': promiseId,
    };
  }
}
