enum ActionType { create, read, update, delete }

enum EventType {
  groupEvent('Kegiatan Kelompok'),
  coopEvent('Kegiatan Koperasi');

  static EventType fromJson(String? value) {
    switch (value) {
      case 'group':
        return EventType.groupEvent;
      case 'coop':
      default:
        return EventType.coopEvent;
    }
  }

  final String displayName;
  const EventType(String this.displayName);
}

enum FundType {
  jointLiabilityFund('Kas Tanggung Renteng'),
  groupFund('Kas Kelompok'),
  socialFund('Dana Sosial');

  static FundType fromJson(String? value) {
    switch (value) {
      case 'kas_tanggung_renteng':
        return FundType.jointLiabilityFund;
      case 'kas_kelompok':
        return FundType.groupFund;
      case 'dana_sosial':
      default:
        return FundType.socialFund;
    }
  }

  final String displayName;
  const FundType(String this.displayName);
}
