class Home {
  final List<TodayPromise> todayPromises;
  final int point;
  final List<UpcomingPromise> upcomingPromises;

  Home({
    required this.todayPromises,
    required this.point,
    required this.upcomingPromises,
  });
}

class TodayPromise {
  final int id;
  final String name;
  final DateTime scheduledAt;
  final String location;
  final String status;
  final String organizerName;
  final String organizerProfileImageUrl;

  TodayPromise({
    required this.id,
    required this.name,
    required this.scheduledAt,
    required this.location,
    required this.status,
    required this.organizerName,
    required this.organizerProfileImageUrl,
  });
}

class UpcomingPromise {
  final DateTime scheduledAt;
  final String name;

  UpcomingPromise({
    required this.scheduledAt,
    required this.name,
  });
}
