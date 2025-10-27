enum AttendanceStatusEnum {
  unconfirmed(displayName: 'Belum Konfirmasi'),
  attend(displayName: 'Hadir'),
  absent(displayName: 'Tidak Hadir');

  final String displayName;

  const AttendanceStatusEnum({required this.displayName});
    String get value => name;

  static AttendanceStatusEnum fromString(String value) {
    return AttendanceStatusEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => AttendanceStatusEnum.unconfirmed,
    );
  }
}
