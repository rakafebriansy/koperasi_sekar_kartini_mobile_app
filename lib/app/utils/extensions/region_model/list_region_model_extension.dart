import 'package:koperasi_sekar_kartini_mobile_app/app/models/region_model.dart';

extension RegionListExtension on List<RegionModel> {
  List<String> get names => map((region) => region.name).toList();
}