enum ActionType { create, read, update, delete }

enum EventType {
  group('Kegiatan Kelompok'),
  coop('Kegiatan Koperasi');

  final String displayName;
  const EventType(String this.displayName);
}

enum FundType {
  sharedLiabilityFund('Kas Tanggung Renteng'),
  groupFund('Kas Kelompok'),
  socialFund('Dana Sosial');

  static FundType fromJson(String? value) {
    switch (value) {
      case 'kas_tanggung_renteng':
        return FundType.sharedLiabilityFund;
      case 'kas_kelompok':
        return FundType.groupFund;
      case 'dana_sosial':
      default:
        return FundType.socialFund;
    }
  }

  @override
  String toString() {
    switch (this) {
      case FundType.sharedLiabilityFund:
        return 'kas_tanggung_renteng';
      case FundType.groupFund:
        return 'kas_kelompok';
      case FundType.socialFund:
        return 'dana_sosial';
    }
  }

  String get name => toString();

  final String displayName;
  const FundType(String this.displayName);
}
