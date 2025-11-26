import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_member_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';

extension WorkAreaListExtension on List<WorkAreaModel> {
  List<String> get names => map((region) => region.districtName).toList();
}

extension GroupReportListExtension on List<GroupReportModel> {
  List<String> get labels => map((g) => g.label).toList();
}

extension GroupMemberListExtension on List<GroupMemberModel> {
  List<GroupMemberModel> sortByName({bool desc = false}) {
    final copy = [...this];

    copy.sort((a, b) {
      final nameA = a.user.name.toLowerCase();
      final nameB = b.user.name.toLowerCase();
      return desc ? nameB.compareTo(nameA) : nameA.compareTo(nameB);
    });

    return copy;
  }
  Map<String, List<GroupMemberModel>> groupByFirstLetter() {
    final Map<String, List<GroupMemberModel>> grouped = {};

    for (final member in sortedByAsc) {
      final firstLetter = member.user.name.substring(0, 1).toUpperCase();

      grouped.putIfAbsent(firstLetter, () => []);
      grouped[firstLetter]!.add(member);
    }

    return grouped;
  }

  List<GroupMemberModel> get sortedByAsc => this.sortByName();
  List<GroupMemberModel> get sortedByDesc => this.sortByName(desc: true);
  Map<String, List<GroupMemberModel>> get groupedByFirstLetter => this.groupByFirstLetter();
}

extension UserListExtension on List<UserModel> {
  List<String> get names => map((region) => region.name).toList();
  List<UserModel> sortByName({bool desc = false}) {
    final copy = [...this];

    copy.sort((a, b) {
      final nameA = a.name.toLowerCase();
      final nameB = b.name.toLowerCase();
      return desc ? nameB.compareTo(nameA) : nameA.compareTo(nameB);
    });

    return copy;
  }
  Map<String, List<UserModel>> groupByFirstLetter() {
    final Map<String, List<UserModel>> grouped = {};

    for (final user in sortedByAsc) {
      final firstLetter = user.name.substring(0, 1).toUpperCase();

      grouped.putIfAbsent(firstLetter, () => []);
      grouped[firstLetter]!.add(user);
    }

    return grouped;
  }

  List<UserModel> get sortedByAsc => this.sortByName();
  List<UserModel> get sortedByDesc => this.sortByName(desc: true);
  Map<String, List<UserModel>> get groupedByFirstLetter => this.groupByFirstLetter();
}


extension GroupListExtension on List<GroupModel> {
  List<GroupModel> sortByDistrictName({bool desc = false}) {
    final copy = [...this];

    copy.sort((a, b) {
      final aDistrict = a.workArea.districtName.toLowerCase();
      final bDistrict = b.workArea.districtName.toLowerCase();

      return desc
          ? bDistrict.compareTo(aDistrict)
          : aDistrict.compareTo(bDistrict);
    });

    return copy;
  }

  Map<String, List<GroupModel>> groupByDistrict() {
    final Map<String, List<GroupModel>> grouped = {};

    for (final group in sortedByDistrictAsc) {
      final district =
          group.workArea.districtName.capitalize;

      grouped.putIfAbsent(district!, () => []);
      grouped[district]!.add(group);
    }

    return grouped;
  }

  List<GroupModel> get sortedByDistrictAsc =>
      sortByDistrictName(desc: false);

  List<GroupModel> get sortedByDistrictDesc =>
      sortByDistrictName(desc: true);

  Map<String, List<GroupModel>> get groupedByDistrict =>
      groupByDistrict();
}


extension EventTypeListExtension on List<EventType> {
  List<String> get names => map((event) => event.displayName).toList();
}