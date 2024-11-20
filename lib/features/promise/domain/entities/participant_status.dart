// ignore_for_file: constant_identifier_names

enum ParticipantStatus {
  ATTENDED('참석'),
  CANCELED('취소'),
  NOT_ATTENDED('불참'),
  READY('참석 예정');

  final String label;

  const ParticipantStatus(this.label);
}
