import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_savings/controllers/manage_savings_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

import '../mocks/mock_api_helper.dart';
import '../fakes/fake_auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ManageSavingsController controller;

  late UserModel dummyUser;
  late SavingsModel dummySavings;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    dummyUser = DummyHelper.user(1);
    dummySavings = DummyHelper.sv(1);

    controller = ManageSavingsController(
      apiHelper: mockApi,
      authController: fakeAuth,
    );
  });

  group('ManageSavingsController', () {
    test('selectSavingsType sets selectedSavingsType correctly', () {
      controller.selectSavingsType('Simpanan Wajib');

      expect(controller.selectedSavingsType, SavingsType.simpananWajib);
    });

    test('createSavings success', () async {
      controller
        ..amountCtrl.text = '50000'
        ..dateCtrl.text = '02/2024'
        ..selectSavingsType('Simpanan Wajib');

      controller.userRx.value = dummyUser;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.createSavings();

      expect(controller.isSubmitted, false);

      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('createSavings handles api error', () async {
      controller
        ..amountCtrl.text = '50000'
        ..dateCtrl.text = '02/2024'
        ..selectSavingsType('Simpanan Wajib');

      controller.userRx.value = dummyUser;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenThrow(Exception('API error'));

      await controller.createSavings();

      expect(controller.isSubmitted, false);

      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('deleteSavings success', () async {
      controller.savingsRx.value = dummySavings;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.deleteSavings();

      expect(controller.isSubmitted, false);

      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('deleteSavings throws when savings is null', () async {
      expect(() => controller.deleteSavings(), throwsA(isA<Exception>()));
    });
  });
}
