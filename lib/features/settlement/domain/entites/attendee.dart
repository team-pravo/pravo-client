class Attendee {
  final int id;
  final String name;
  final String? profileImageUrl;

  Attendee({
    required this.id,
    required this.name,
    this.profileImageUrl,
  });
}
