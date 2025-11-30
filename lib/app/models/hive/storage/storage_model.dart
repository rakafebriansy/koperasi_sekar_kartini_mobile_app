// ignore_for_file: annotate_overrides

import 'package:hive_flutter/hive_flutter.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/hive/hive_adapters.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/hive/hive_types.dart';

part 'storage_model.g.dart';

@HiveType(typeId: HiveTypes.storage, adapterName: HiveAdapters.storage)
class StorageModel extends HiveObject {
  StorageModel({required this.key, required this.value, this.expiredDate});

  @HiveField(0)
  final String key;
  @HiveField(1)
  final dynamic value;
  @HiveField(2)
  final DateTime? expiredDate;
}
