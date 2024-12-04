// ignore_for_file: constant_identifier_names

enum ButtonStatus {
  COPY_INVITATION_LINK('초대 링크 복사'),
  GO_TO_ATTENDANCE_CONFIRMATION('참석 확인하러 가기'),
  JOIN_PROMISE('약속 참가하기'),
  HIDDEN(''); // 버튼 숨김 상태

  final String text;

  const ButtonStatus(this.text);

  static ButtonStatus getButtonStatus(
    bool isOrganizer,
    bool isInvitedGuest,
    DateTime scheduledAt,
  ) {
    final currentTime = DateTime.now();
    final timeDifferenceInMinutes =
        scheduledAt.difference(currentTime).inMinutes;

    if (timeDifferenceInMinutes <= 60) {
      return isOrganizer
          ? ButtonStatus.GO_TO_ATTENDANCE_CONFIRMATION
          : ButtonStatus.HIDDEN;
    }

    if (isOrganizer) return ButtonStatus.COPY_INVITATION_LINK;
    if (isInvitedGuest) return ButtonStatus.JOIN_PROMISE;

    return ButtonStatus.HIDDEN;
  }
}
