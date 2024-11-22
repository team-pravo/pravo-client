enum ButtonStatus {
  copyInvitationLink('초대 링크 복사'),
  goToAttendanceConfirmation('참석 확인하러 가기'),
  hidden(''); // 버튼 숨김 상태

  final String text;

  const ButtonStatus(this.text);

  static ButtonStatus getButtonStatus(bool isOrganizer, DateTime scheduledAt) {
    final currentTime = DateTime.now();
    final timeDifferenceInMinutes =
        scheduledAt.difference(currentTime).inMinutes;

    if (isOrganizer) {
      return timeDifferenceInMinutes <= 60
          ? ButtonStatus.goToAttendanceConfirmation
          : ButtonStatus.copyInvitationLink;
    }
    return ButtonStatus.hidden;
  }
}
