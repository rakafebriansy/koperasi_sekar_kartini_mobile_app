import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/dashboard_stats/dashboard_stats_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan_distribution/loan_distribution_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/member_growth/member_growth_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings_distribution/savings_distribution_model.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';

class DummyHelper {
  //WORK AREA
  static final List<WorkAreaModel> workAreas = [
    WorkAreaModel(id: 1, name: "Kantor Pusat", createdAt: DateTime(2023, 1, 1)),
    WorkAreaModel(id: 2, name: "Cabang Jakarta Selatan"),
    WorkAreaModel(id: 3, name: "Cabang Jakarta Barat"),
    WorkAreaModel(id: 4, name: "Cabang Tangerang"),
    WorkAreaModel(id: 5, name: "Cabang Bekasi"),
    WorkAreaModel(id: 6, name: "Cabang Bogor"),
    WorkAreaModel(id: 7, name: "Cabang Depok"),
    WorkAreaModel(id: 8, name: "Cabang Bandung"),
    WorkAreaModel(id: 9, name: "Cabang Surabaya"),
    WorkAreaModel(id: 10, name: "Cabang Malang"),
    WorkAreaModel(id: 11, name: "Cabang Medan"),
    WorkAreaModel(id: 12, name: "Cabang Makassar"),
    WorkAreaModel(id: 13, name: "Cabang Semarang"),
    WorkAreaModel(id: 14, name: "Cabang Yogyakarta"),
    WorkAreaModel(id: 15, name: "Cabang Denpasar"),
  ];
  static WorkAreaModel wa(int id) => workAreas.firstWhere((w) => w.id == id);

  // USERS
  static final List<UserModel> users = [
    UserModel(
      id: 1,
      name: "Rizky Pratama",
      memberNumber: "MBR-1023",
      identityNumber: "3275012301980001",
      birthDate: DateTime(1998, 1, 23),
      phoneNumber: "081298112233",
      address: "Jakarta Selatan",
      occupation: "Staff Administrasi",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2023, 3, 10),
      role: "member",
      workArea: wa(2),
      isActive: true,
      createdAt: DateTime(2023, 3, 1),
      updatedAt: DateTime(2023, 3, 1),
    ),
    UserModel(
      id: 2,
      name: "Dewi Anggraini",
      memberNumber: "MBR-1044",
      identityNumber: "3674031506950004",
      birthDate: DateTime(1995, 6, 15),
      phoneNumber: "082144556677",
      address: "Tangerang",
      occupation: "Guru SD",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2023, 5, 20),
      role: "member",
      workArea: wa(4),
      isActive: true,
      createdAt: DateTime(2023, 5, 10),
      updatedAt: DateTime(2023, 5, 10),
    ),
    UserModel(
      id: 3,
      name: "Arif Setiawan",
      memberNumber: "MBR-1087",
      identityNumber: "3517011111910008",
      birthDate: DateTime(1991, 11, 11),
      phoneNumber: "085799112200",
      address: "Surabaya",
      occupation: "Teknisi IT",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: null,
      role: "member",
      workArea: wa(9),
      isActive: true,
      createdAt: DateTime(2023, 6, 14),
      updatedAt: DateTime(2023, 6, 14),
    ),
    UserModel(
      id: 4,
      name: "Siti Marlina",
      memberNumber: "MBR-1102",
      identityNumber: "3276012404990007",
      birthDate: DateTime(1999, 4, 24),
      phoneNumber: "081312778899",
      address: "Bekasi",
      occupation: "Perawat",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2024, 1, 8),
      role: "member",
      workArea: wa(5),
      isActive: true,
      createdAt: DateTime(2024, 1, 5),
      updatedAt: DateTime(2024, 1, 5),
    ),
    UserModel(
      id: 5,
      name: "Hendra Wijaya",
      memberNumber: "MBR-1120",
      identityNumber: "3174022907870003",
      birthDate: DateTime(1987, 7, 29),
      phoneNumber: "081290334455",
      address: "Bandung",
      occupation: "Wiraswasta",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: null,
      role: "admin",
      workArea: wa(8),
      isActive: true,
      createdAt: DateTime(2024, 3, 2),
      updatedAt: DateTime(2024, 3, 2),
    ),
  ];
  static UserModel user(int id) => users.firstWhere((u) => u.id == id);

  // INACTIVE USERS
  static List<UserModel> inactiveUsers = [
    UserModel(
      id: 2,
      name: "Aulia Rahman",
      memberNumber: "MBR-2044",
      identityNumber: "3275011502970002",
      birthDate: DateTime(1997, 2, 15),
      phoneNumber: "081212334455",
      address: "Bandung",
      occupation: "Staff Gudang",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2023, 4, 12),
      role: "member",
      workArea: wa(3),
      isActive: false,
      createdAt: DateTime(2023, 4, 1),
      updatedAt: DateTime(2023, 4, 1),
    ),

    UserModel(
      id: 3,
      name: "Dewi Lestari",
      memberNumber: "MBR-3055",
      identityNumber: "3275013009960003",
      birthDate: DateTime(1996, 9, 30),
      phoneNumber: "081298443322",
      address: "Depok",
      occupation: "Kasir Minimarket",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2023, 5, 9),
      role: "member",
      workArea: wa(1),
      isActive: false,
      createdAt: DateTime(2023, 5, 2),
      updatedAt: DateTime(2023, 5, 2),
    ),

    UserModel(
      id: 4,
      name: "Budi Santoso",
      memberNumber: "MBR-4066",
      identityNumber: "3275011111950004",
      birthDate: DateTime(1995, 11, 11),
      phoneNumber: "081234554433",
      address: "Bogor",
      occupation: "Driver Operasional",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2023, 6, 20),
      role: "member",
      workArea: wa(4),
      isActive: false,
      createdAt: DateTime(2023, 6, 10),
      updatedAt: DateTime(2023, 6, 10),
    ),

    UserModel(
      id: 5,
      name: "Citra Maharani",
      memberNumber: "MBR-5077",
      identityNumber: "3275010803960005",
      birthDate: DateTime(1996, 3, 8),
      phoneNumber: "081267889900",
      address: "Cikarang",
      occupation: "Operator Produksi",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2023, 7, 5),
      role: "member",
      workArea: wa(2),
      isActive: false,
      createdAt: DateTime(2023, 7, 1),
      updatedAt: DateTime(2023, 7, 1),
    ),

    UserModel(
      id: 6,
      name: "Thomas Wibowo",
      memberNumber: "MBR-6088",
      identityNumber: "3275012204940006",
      birthDate: DateTime(1994, 4, 22),
      phoneNumber: "081233221144",
      address: "Tangerang",
      occupation: "Security",
      identityCardPhoto: "",
      selfPhoto: "",
      emailVerifiedAt: DateTime(2023, 8, 17),
      role: "member",
      workArea: wa(5),
      isActive: false,
      createdAt: DateTime(2023, 8, 10),
      updatedAt: DateTime(2023, 8, 10),
    ),
  ];
  static UserModel inuser(int id) =>
      inactiveUsers.firstWhere((u) => u.id == id);

  // GROUPS
  static final List<GroupModel> groups = [
    GroupModel(
      id: 1,
      number: 1,
      description: "Kelompok simpan pinjam A",
      sharedLiabilityFundAmount: 1500000,
      groupFundAmount: 2000000,
      socialFundAmount: 500000,
      workArea: wa(2),
      chairman: user(1),
      facilitator: user(5),
      createdAt: DateTime(2023, 3, 1),
      updatedAt: DateTime(2023, 3, 1),
    ),
    GroupModel(
      id: 2,
      number: 2,
      description: "Kelompok usaha mikro B",
      sharedLiabilityFundAmount: 1200000,
      groupFundAmount: 1800000,
      socialFundAmount: 400000,
      workArea: wa(4),
      chairman: user(2),
      facilitator: user(1),
      createdAt: DateTime(2023, 4, 10),
      updatedAt: DateTime(2023, 4, 10),
    ),
    GroupModel(
      id: 3,
      number: 3,
      description: "Kelompok simpanan Yogyakarta",
      sharedLiabilityFundAmount: 2000000,
      groupFundAmount: 2600000,
      socialFundAmount: 600000,
      workArea: wa(14),
      chairman: user(3),
      facilitator: user(4),
      createdAt: DateTime(2023, 6, 2),
      updatedAt: DateTime(2023, 6, 2),
    ),
    GroupModel(
      id: 4,
      number: 4,
      description: "Kelompok ekonomi Bandung",
      sharedLiabilityFundAmount: 1750000,
      groupFundAmount: 2100000,
      socialFundAmount: 475000,
      workArea: wa(8),
      chairman: user(5),
      facilitator: user(3),
      createdAt: DateTime(2023, 8, 12),
      updatedAt: DateTime(2023, 8, 12),
    ),
    GroupModel(
      id: 5,
      number: 5,
      description: "Kelompok wanita mandiri Makassar",
      sharedLiabilityFundAmount: 1600000,
      groupFundAmount: 2200000,
      socialFundAmount: 550000,
      workArea: wa(12),
      chairman: user(4),
      facilitator: user(2),
      createdAt: DateTime(2023, 9, 1),
      updatedAt: DateTime(2023, 9, 1),
    ),
  ];
  static GroupModel group(int id) => groups.firstWhere((g) => g.id == id);

  // REPORTS
  static final List<ReportModel> reports = [
    ReportModel(
      id: 1,
      quarter: Quarter.triwulan1,
      year: 2024,
      memberGrowthIn: 20,
      memberGrowthInPercentage: 5.5,
      memberGrowthOut: 5,
      memberGrowthOutPercentage: 1.2,
      groupMemberTotal: 350,
      groupMemberTotalPercentage: 98.0,
      administrativeCompliancePercentage: 95.0,
      depositCompliancePercentage: 92.5,
      attendancePercentage: 90.0,
      organizationFinalScorePercentage: 93.2,
      loanParticipationPb: 120,
      loanParticipationBbm: 80,
      loanParticipationStore: 60,
      cashParticipation: 200,
      cashParticipationPercentage: 85.0,
      savingsParticipation: 260,
      savingsParticipationPercentage: 88.5,
      meetingDepositPercentage: 91.0,
      loanBalancePb: 50000000,
      loanBalanceBbm: 30000000,
      loanBalanceStore: 20000000,
      receivableScorePercentage: 89.5,
      financialFinalScorePercentage: 90.8,
      combinedFinalScorePercentage: 92.0,
      criteria: ReportCriteria.sangatBaik,
      groupId: 1,
    ),
    ReportModel(
      id: 2,
      quarter: Quarter.triwulan2,
      year: 2024,
      memberGrowthIn: 10,
      memberGrowthInPercentage: 2.8,
      memberGrowthOut: 8,
      memberGrowthOutPercentage: 2.1,
      groupMemberTotal: 352,
      groupMemberTotalPercentage: 97.5,
      administrativeCompliancePercentage: 88.0,
      depositCompliancePercentage: 85.0,
      attendancePercentage: 87.0,
      organizationFinalScorePercentage: 86.4,
      loanParticipationPb: 110,
      loanParticipationBbm: 75,
      loanParticipationStore: 55,
      cashParticipation: 180,
      cashParticipationPercentage: 80.0,
      savingsParticipation: 240,
      savingsParticipationPercentage: 82.0,
      meetingDepositPercentage: 85.5,
      loanBalancePb: 48000000,
      loanBalanceBbm: 28000000,
      loanBalanceStore: 18000000,
      receivableScorePercentage: 82.5,
      financialFinalScorePercentage: 84.0,
      combinedFinalScorePercentage: 85.2,
      criteria: ReportCriteria.baik,
      groupId: 1,
    ),
    ReportModel(
      id: 3,
      quarter: Quarter.triwulan3,
      year: 2024,
      memberGrowthIn: 5,
      memberGrowthInPercentage: 1.2,
      memberGrowthOut: 12,
      memberGrowthOutPercentage: 3.5,
      groupMemberTotal: 345,
      groupMemberTotalPercentage: 95.0,
      administrativeCompliancePercentage: 78.0,
      depositCompliancePercentage: 75.0,
      attendancePercentage: 72.0,
      organizationFinalScorePercentage: 75.6,
      loanParticipationPb: 90,
      loanParticipationBbm: 60,
      loanParticipationStore: 45,
      cashParticipation: 150,
      cashParticipationPercentage: 68.0,
      savingsParticipation: 200,
      savingsParticipationPercentage: 70.5,
      meetingDepositPercentage: 73.0,
      loanBalancePb: 45000000,
      loanBalanceBbm: 26000000,
      loanBalanceStore: 16000000,
      receivableScorePercentage: 70.0,
      financialFinalScorePercentage: 72.5,
      combinedFinalScorePercentage: 74.0,
      criteria: ReportCriteria.cukup,
      groupId: 2,
    ),
  ];

  static ReportModel report(int id) => reports.firstWhere((r) => r.id == id);
  static List<ReportModel> reportsByGroup(int groupId) =>
      reports.where((r) => r.groupId == groupId).toList();
  static List<ReportModel> reportsByYear(int year) =>
      reports.where((r) => r.year == year).toList();

  // EVENTS
  static final List<EventModel> events = [
    EventModel(
      id: 1,
      name: 'Rapat Kelompok A',
      type: EventType.group,
      datetime: DateTime(2025, 12, 15, 10, 0),
      location: 'Ruang A',
      photo: null,
      description: 'Rapat rutin anggota kelompok A',
      group: groups[0],
      user: users[0],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventModel(
      id: 2,
      name: 'Rapat Koperasi',
      type: EventType.coop,
      datetime: DateTime(2025, 12, 16, 14, 0),
      location: 'Kantor Koperasi',
      photo: null,
      description: 'Rapat tahunan koperasi',
      group: null,
      user: users[0],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventModel(
      id: 3,
      name: 'Pelatihan Anggota',
      type: EventType.group,
      datetime: DateTime(2025, 12, 20, 9, 0),
      location: 'Ruang Pelatihan',
      photo: null,
      description: 'Pelatihan untuk anggota baru',
      group: groups[0],
      user: users[0],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  static EventModel ev(int id) => events.firstWhere((e) => e.id == id);

  // LOANS
  static List<LoanModel> loans = [
    LoanModel(
      id: 1,
      type: LoanType.pinjamanBiasa,
      status: LoanStatus.unpaid,
      nominal: 50000,
      year: 2025,
      month: 12,
      user: user(1),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    LoanModel(
      id: 2,
      type: LoanType.pinjamanPengadaanBarang,
      status: LoanStatus.paid,
      nominal: 100000,
      year: 2025,
      month: 11,
      user: user(2),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    LoanModel(
      id: 3,
      type: LoanType.pinjamanBbm,
      status: LoanStatus.unpaid,
      nominal: 75000,
      year: 2025,
      month: 10,
      user: user(3),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  static LoanModel lo(int id) => loans.firstWhere((e) => e.id == id);

  // SAVINGS
  static List<SavingsModel> savings = [
    SavingsModel(
      id: 1,
      type: SavingsType.simpananPokok,
      nominal: 50000,
      year: 2025,
      month: 12,
      user: user(1),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    SavingsModel(
      id: 2,
      type: SavingsType.simpananWajib,
      nominal: 75000,
      year: 2025,
      month: 11,
      user: user(2),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    SavingsModel(
      id: 3,
      type: SavingsType.simpananSukarela,
      nominal: 100000,
      year: 2025,
      month: 10,
      user: user(3),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  static SavingsModel sv(int id) => savings.firstWhere((e) => e.id == id);

  // MEMBER GROWTH
  static MemberGrowthModel memberGrowth(int year) =>
      MemberGrowthModel(year: year, total: 350.0);

  // SAVING DISTRIBUTION
  static SavingsDistributionModel savingsDistribution(String type) =>
      SavingsDistributionModel(type: type, total: 50000000.0);

  // LOAN DISTRIBUTION
  static LoanDistributionModel loanDistribution(String type) =>
      LoanDistributionModel(type: type, total: 75000000.0);

  // DASHBOARD STATS
  static DashboardStatsModel dashboardStats({
    int year = 2024,
    int quarter = 1,
  }) {
    return DashboardStatsModel(
      meta: DashboardMeta(year: year, quarter: quarter),
      member: MemberStats(
        joinedThisQuarter: 20,
        joinedPercentage: 5.5,
        leftThisQuarter: 5,
        leftPercentage: 1.2,
        totalActiveMembers: 320,
        totalInactiveMembers: 30,
      ),
      savings: SavingsStats(
        usersNotSavedThisQuarter: 15,
        totalSavingsThisQuarter: 150000000,
        savingPercentage: 88.5,
      ),
      loan: LoanStats(
        usersUnpaidLoanThisQuarter: 12,
        totalUnpaidLoanThisQuarter: 120000000,
        loanPercentage: 82.0,
      ),
    );
  }
}
