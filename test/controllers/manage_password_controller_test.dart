import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_password/controllers/manage_password_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ManagePasswordController controller;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    controller = ManagePasswordController(apiHelper: mockApi);
  });

  group('ManagePasswordController', () {
    test('updatePassword success', () async {
      controller
        ..passwordCtrl.text = 'oldPassword123'
        ..newPasswordCtrl.text = 'newPassword123'
        ..confirmNewPasswordCtrl.text = 'newPassword123';

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.updatePassword();

      expect(controller.isSubmitted, false);

      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('updatePassword handles api error', () async {
      controller
        ..passwordCtrl.text = 'oldPassword'
        ..newPasswordCtrl.text = 'newPassword';

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenThrow(Exception('API error'));

      await controller.updatePassword();

      expect(controller.isSubmitted, false);

      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });
  });
}
