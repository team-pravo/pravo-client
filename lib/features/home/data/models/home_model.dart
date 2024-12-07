class HomeModel {
  final List<TodayPromiseModel> todayPromises;
  final int point;
  final List<UpcomingPromiseModel> upcomingPromises;

  HomeModel({
    required this.todayPromises,
    required this.point,
    required this.upcomingPromises,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      todayPromises: (json['todayPromiseDto'] as List)
          .map((item) => TodayPromiseModel.fromJson(item))
          .toList(),
      point: json['point'],
      upcomingPromises: (json['upcomingPromiseDto'] as List)
          .map((item) => UpcomingPromiseModel.fromJson(item))
          .toList(),
    );
  }
}

class TodayPromiseModel {
  final int id;
  final String name;
  final String scheduledAt;
  final String location;
  final String status;
  final String organizerName;
  final String organizerProfileImageUrl;

  TodayPromiseModel({
    required this.id,
    required this.name,
    required this.scheduledAt,
    required this.location,
    required this.status,
    required this.organizerName,
    required this.organizerProfileImageUrl,
  });

  factory TodayPromiseModel.fromJson(Map<String, dynamic> json) {
    return TodayPromiseModel(
      id: json['id'],
      name: json['name'],
      scheduledAt: json['scheduledAt'],
      location: json['location'],
      status: json['status'],
      organizerName: json['organizerName'],
      organizerProfileImageUrl: json['organizerProfileImageUrl'],
    );
  }
}

class UpcomingPromiseModel {
  final String scheduledAt;
  final String name;

  UpcomingPromiseModel({
    required this.scheduledAt,
    required this.name,
  });

  factory UpcomingPromiseModel.fromJson(Map<String, dynamic> json) {
    return UpcomingPromiseModel(
      scheduledAt: json['scheduledAt'],
      name: json['name'],
    );
  }
}
