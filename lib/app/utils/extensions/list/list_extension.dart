import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_member_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/region_model.dart';

extension RegionListExtension on List<RegionModel> {
  List<String> get names => map((region) => region.name).toList();
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
