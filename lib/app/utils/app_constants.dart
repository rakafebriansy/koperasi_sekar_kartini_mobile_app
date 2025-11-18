import 'package:flutter/cupertino.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/region_model.dart';

class AppConstants {
  static AppFormKey appFormKey = AppFormKey();
  static List<RegionModel> regionModelsFromApi = [
    RegionModel(name: 'Sumbersari'),
    RegionModel(name: 'Patrang'),
    RegionModel(name: 'Mayang'),
    RegionModel(name: 'Mangli'),
    RegionModel(name: 'Antirogo'),
    RegionModel(name: 'Pakusari'),
    RegionModel(name: 'Rambipuji'),
  ];
}

class AppFormKey {
  Key register_dropdownSearch = Key('dropdownRegionForRegister');
}

