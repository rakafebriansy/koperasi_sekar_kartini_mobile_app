import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_area_model.freezed.dart';
part 'work_area_model.g.dart';


@freezed
class WorkAreaModel with _$WorkAreaModel {
  const factory WorkAreaModel({
    required int id,
    @JsonKey(name: 'name_work_area') required String name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _WorkAreaModel;

  factory WorkAreaModel.fromJson(Map<String, dynamic> json) =>
      _$WorkAreaModelFromJson(json);
}

