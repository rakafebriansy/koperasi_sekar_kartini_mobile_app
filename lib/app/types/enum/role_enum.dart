enum RoleEnum {
  admin(displayName: 'Pengurus'),
  employee(displayName: 'Karyawan'),
  groupLeader(displayName: 'Penanggung Jawab Kelompok'),
  groupCompanionOfficer(displayName: 'Petugas Pendamping Kelompok'),
  groupMember(displayName: 'Anggota');

  final String displayName;

  const RoleEnum({required this.displayName});
  String get value {
    switch (this) {
      case RoleEnum.employee:
        return 'employee';
      case RoleEnum.admin:
        return 'admin';
      case RoleEnum.groupLeader:
        return 'groupLeader';
      case RoleEnum.groupCompanionOfficer:
        return 'groupCompanionOfficer';
      case RoleEnum.groupMember:
        return 'groupMember';
    }
  }

  static RoleEnum fromString(String value) {
    switch (value.toLowerCase()) {
      case 'employee':
        return RoleEnum.employee;
      case 'admin':
        return RoleEnum.admin;
      case 'groupLeader':
        return RoleEnum.groupLeader;
      case 'groupCompanionOfficer':
        return RoleEnum.groupCompanionOfficer;
      case 'groupMember':
        return RoleEnum.groupMember;
      default:
        throw Exception('Undefined role: $value');
    }
  }
}
