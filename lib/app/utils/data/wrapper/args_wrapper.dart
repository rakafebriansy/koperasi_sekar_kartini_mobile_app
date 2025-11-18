import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';

class ArgsWrapper {
  final ActionType action;
  final dynamic data;

  bool get isCreateAction => action == ActionType.create;
  bool get isReadAction => action == ActionType.read;
  bool get isUpdateAction => action == ActionType.update;
  bool get isDeleteAction => action == ActionType.delete;

  ArgsWrapper({required this.action, required this.data});
}
