import 'package:flutter/cupertino.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/region_model.dart';

class AppConstants {
  static AppFormKey appFormKey = AppFormKey();
  static List<RegionModel> regionModelsFromApi = [
    RegionModel(id: 1,name: 'Sumbersari'),
    RegionModel(id: 2,name: 'Patrang'),
    RegionModel(id: 3,name: 'Mayang'),
    RegionModel(id: 4,name: 'Mangli'),
    RegionModel(id: 5,name: 'Antirogo'),
    RegionModel(id: 6,name: 'Pakusari'),
    RegionModel(id: 7,name: 'Rambipuji'),
  ];
}

class AppFormKey {
  Key register_dropdownSearch = Key('dropdownRegionForRegister');
}

