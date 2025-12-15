import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/serialization/model_registry.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan_distribution/loan_distribution_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/member_growth/member_growth_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings_distribution/savings_distribution_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';

void registerModels() {
  ModelRegistry.register<UserModel>(
    fromJson: (json) => UserModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );

  ModelRegistry.register<GroupModel>(
    fromJson: (json) => GroupModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );

  ModelRegistry.register<WorkAreaModel>(
    fromJson: (json) => WorkAreaModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );

  ModelRegistry.register<EventModel>(
    fromJson: (json) => EventModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );

  ModelRegistry.register<LoanModel>(
    fromJson: (json) => LoanModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );

  ModelRegistry.register<SavingsModel>(
    fromJson: (json) => SavingsModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );
  ModelRegistry.register<ReportModel>(
    fromJson: (json) => ReportModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );
  ModelRegistry.register<MemberGrowthModel>(
    fromJson: (json) => MemberGrowthModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );
  ModelRegistry.register<SavingsDistributionModel>(
    fromJson: (json) => SavingsDistributionModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );
  ModelRegistry.register<LoanDistributionModel>(
    fromJson: (json) => LoanDistributionModel.fromJson(json),
    toJson: (obj) => obj.toJson(),
  );
}
