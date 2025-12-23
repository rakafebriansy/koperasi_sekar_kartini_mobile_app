import 'package:mocktail/mocktail.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

class FakeApi extends Mock {
  Future<UserModel> createUser({
    required String name,
    required String identityNumber,
    String? memberNumber,
    String? birthDate,
    required String phoneNumber,
    String? address,
    String? occupation,
    String? password,
    dynamic identityCardPhoto,
    dynamic selfPhoto,
    dynamic memberCardPhoto,
    required String role,
  });

  Future<UserModel> updateUser({
    required int id,
    String? name,
    String? identityNumber,
    String? memberNumber,
    String? birthDate,
    String? phoneNumber,
    String? address,
    String? occupation,
    String? password,
    dynamic identityCardPhoto,
    dynamic selfPhoto,
    dynamic memberCardPhoto,
    required String role,
  });

  Future<void> deleteUser({required int id});
}
