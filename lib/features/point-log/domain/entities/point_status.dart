// ignore_for_file: constant_identifier_names

enum PointStatus {
  PLUS('적립'),
  MINUS('사용');

  final String label;

  const PointStatus(this.label);
}
