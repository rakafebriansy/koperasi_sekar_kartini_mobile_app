import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';

extension ActionTypeExtension on ActionType {
  bool get isCreateAction => this == ActionType.create;
  bool get isReadAction => this == ActionType.read;
  bool get isUpdateAction => this == ActionType.update;
  bool get isDeleteAction => this == ActionType.delete;
}
