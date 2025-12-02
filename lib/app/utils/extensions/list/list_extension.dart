import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group_report/group_report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';

extension ListExtension<T> on List<T> {
  bool areEqualTo(
    List<T> other, {
    int Function(T a, T b)? compare,
    dynamic Function(int index, T element)? a,
    dynamic Function(int index, T element)? b,
  }) {
    if (length != other.length) return false;

    sort(compare);
    other.sort(compare);

    for (int i = 0; i < length; i++) {
      if ((a?.call(i, this[i]) ?? this[i]) !=
          (b?.call(i, other[i]) ?? other[i]))
        return false;
    }

    return true;
  }

  bool containSameElement({int Function(T a, T b)? compare}) {
    if (isEmpty) return false;

    sort(compare);

    for (int i = 0; i < length; i++) {
      for (int j = 0; j < length; j++) {
        if (this[i] == this[j] && i != j) {
          return true;
        }
      }
    }

    return false;
  }
}

extension WorkAreaListExtension on List<WorkAreaModel> {
  List<String> get names => map((region) => region.name).toList();

  WorkAreaModel? findByName(String? name) {
    if (name == null) return null;
    return firstWhere((item) => item.name == name);
  }
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

  List<UserModel> get sortedByAsc => sortByName();
  List<UserModel> get sortedByDesc => sortByName(desc: true);
  Map<String, List<UserModel>> get groupedByFirstLetter => groupByFirstLetter();
}

extension GroupListExtension on List<GroupModel> {
  List<GroupModel> sortByDistrictName({bool desc = false}) {
    final copy = [...this];

    copy.sort((a, b) {
      final aDistrict = a.workArea!.name.toLowerCase();
      final bDistrict = b.workArea!.name.toLowerCase();

      return desc
          ? bDistrict.compareTo(aDistrict)
          : aDistrict.compareTo(bDistrict);
    });

    return copy;
  }

  Map<String, List<GroupModel>> groupByDistrict() {
    final Map<String, List<GroupModel>> grouped = {};

    for (final group in sortedByDistrictAsc) {
      final district = group.workArea!.name.capitalize;

      grouped.putIfAbsent(district!, () => []);
      grouped[district]!.add(group);
    }

    return grouped;
  }

  List<GroupModel> get sortedByDistrictAsc => sortByDistrictName(desc: false);

  List<GroupModel> get sortedByDistrictDesc => sortByDistrictName(desc: true);

  Map<String, List<GroupModel>> get groupedByDistrict => groupByDistrict();
}

extension EventTypeListExtension on List<EventType> {
  List<String> get names => map((event) => event.displayName).toList();
}

extension GroupReportListExtension on List<GroupReportModel> {
  List<String> get labels => map((g) => g.label).toList();
}
