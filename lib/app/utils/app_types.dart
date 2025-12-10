enum ActionType { create, read, update, delete }

enum FundType {
  sharedLiabilityFund('Kas Tanggung Renteng'),
  groupFund('Kas Kelompok'),
  socialFund('Dana Sosial');

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