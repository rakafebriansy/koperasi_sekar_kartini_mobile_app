import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';

class GroupReportModel {
  final String id;
  final DateTime quarter;

  final int incomingMembers;
  final int incomingMembersPercentage;

  final int outgoingMembers;
  final int outgoingMembersPercentage;

  final int totalMembers;
  final int totalMembersPercentage;

  final int administrationOrderPercentage;
  final int depositOrderPercentage;
  final int attendancePercentage;

  final int finalOrganizationScorePercentage;

  final int loanParticipationPb;
  final int loanParticipationBbm;
  final int loanParticipationStore;

  final int cashParticipation;
  final int cashParticipationPercentage;

  final int savingParticipation;
  final int savingParticipationPercentage;

  final int meetingDepositPercentage;

  final int loanBalancePb;
  final int loanBalanceBbm;
  final int loanBalanceStore;

  final int finalFinanceScorePercentage;
  final int combinedScorePercentage;

  final int receivableScorePercentage;
  final int criteria;

  final GroupModel group;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  String get label => formatLabel(quarter);

  String formatLabel(DateTime date) {
    int quarter = ((date.month - 1) ~/ 3) + 1;

    return "${date.year} - Triwulan $quarter";
  }

  GroupReportModel({
    required this.id,
    required this.quarter,
    required this.incomingMembers,
    required this.incomingMembersPercentage,
    required this.outgoingMembers,
    required this.outgoingMembersPercentage,
    required this.totalMembers,
    required this.totalMembersPercentage,
    required this.administrationOrderPercentage,
    required this.depositOrderPercentage,
    required this.attendancePercentage,
    required this.finalOrganizationScorePercentage,
    required this.loanParticipationPb,
    required this.loanParticipationBbm,
    required this.loanParticipationStore,
    required this.cashParticipation,
    required this.cashParticipationPercentage,
    required this.savingParticipation,
    required this.savingParticipationPercentage,
    required this.meetingDepositPercentage,
    required this.loanBalancePb,
    required this.loanBalanceBbm,
    required this.loanBalanceStore,
    required this.finalFinanceScorePercentage,
    required this.combinedScorePercentage,
    required this.criteria,
    required this.receivableScorePercentage,
    required this.group,
    this.createdAt,
    this.updatedAt,
  });

  factory GroupReportModel.fromJson(Map<String, dynamic> json) {
    return GroupReportModel(
      id: json['id'],
      quarter: DateTime.parse(json['quarter']),
      incomingMembers: json['incoming_members'],
      incomingMembersPercentage: json['incoming_members_%'],
      outgoingMembers: json['outgoing_embers'],
      outgoingMembersPercentage: json['outgoing_embers_%'],
      totalMembers: json['total_members'],
      totalMembersPercentage: json['total_members_%'],
      administrationOrderPercentage: json['administration_order_%'],
      depositOrderPercentage: json['deposit_order_%'],
      attendancePercentage: json['attendance_%'],
      finalOrganizationScorePercentage: json['final_organization_score_%'],
      loanParticipationPb: json['loan_participation_pb'],
      loanParticipationBbm: json['loan_participation_bbm'],
      loanParticipationStore: json['loan_participation_store'],
      cashParticipation: json['cash_participation'],
      cashParticipationPercentage: json['cash_participation_%'],
      savingParticipation: json['saving_participation'],
      savingParticipationPercentage: json['saving_participation_%'],
      meetingDepositPercentage: json['meeting_deposit_%'],
      loanBalancePb: json['loan_balance_pb'],
      loanBalanceBbm: json['loan_balance_nbm'],
      loanBalanceStore: json['loan_balance_tore'],
      finalFinanceScorePercentage: json['final_finance_score_%'],
      combinedScorePercentage: json['combined_score_%'],
      criteria: json['criteria'],
      receivableScorePercentage: json['receivable_score_%'],
      group: GroupModel.fromJson(json['group']),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'incoming_members': incomingMembers,
      'incoming_members_%': incomingMembersPercentage,
      'outgoing_embers': outgoingMembers,
      'outgoing_embers_%': outgoingMembersPercentage,
      'total_members': totalMembers,
      'total_members_%': totalMembersPercentage,
      'administration_order_%': administrationOrderPercentage,
      'deposit_order_%': depositOrderPercentage,
      'attendance_%': attendancePercentage,
      'final_organization_score_%': finalOrganizationScorePercentage,
      'loan_participation_pb': loanParticipationPb,
      'loan_participation_bbm': loanParticipationBbm,
      'loan_participation_store': loanParticipationStore,
      'cash_participation': cashParticipation,
      'cash_participation_%': cashParticipationPercentage,
      'saving_participation': savingParticipation,
      'saving_participation_%': savingParticipationPercentage,
      'meeting_deposit_%': meetingDepositPercentage,
      'loan_balance_pb': loanBalancePb,
      'loan_balance_nbm': loanBalanceBbm,
      'loan_balance_tore': loanBalanceStore,
      'final_finance_score_%': finalFinanceScorePercentage,
      'combined_score_%': combinedScorePercentage,
      'receivable_score_%': receivableScorePercentage,
      'criteria': criteria,
      'group': group.toJson(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
