import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/savings_list/controllers/savings_list_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

import '../mocks/mock_api_helper.dart';
import '../fakes/fake_auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SavingsListController controller;

  late UserModel dummyUser;
  late List<SavingsModel> dummySavings;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    dummyUser = DummyHelper.user(1);
    dummySavings = [DummyHelper.sv(1), DummyHelper.sv(2)];

    controller = SavingsListController(
      apiHelper: mockApi,
      authController: fakeAuth,
    );

    controller.memberRx.value = dummyUser;
  });

  group('SavingsListController', () {
    test('fetchListSavings success', () async {
      when(
        () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummySavings);

      await controller.fetchListSavings(memberId: dummyUser.id);

      expect(controller.isFetching, false);
      expect(controller.savingsList.length, 2);

      verify(
        () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchListSavings handles error', () async {
      when(
        () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
      ).thenThrow(Exception('API error'));

      await controller.fetchListSavings(memberId: dummyUser.id);

      expect(controller.isFetching, false);
      expect(controller.savingsList.isEmpty, true);

      verify(
        () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('onSearchChanged triggers fetch after debounce', () {
      fakeAsync((async) {
        when(
          () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
        ).thenAnswer((_) async => dummySavings);

        controller.onSearchChanged('simpanan');

        async.elapse(const Duration(milliseconds: 500));
        verifyNever(
          () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
        );

        async.elapse(const Duration(seconds: 1));

        verify(
          () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
        ).called(1);
      });
    });

    test('onSearchChanged cancels previous debounce', () {
      fakeAsync((async) {
        when(
          () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
        ).thenAnswer((_) async => dummySavings);

        controller.onSearchChanged('sim');
        async.elapse(const Duration(milliseconds: 400));

        controller.onSearchChanged('simpanan');

        async.elapse(const Duration(seconds: 1));

        verify(
          () => mockApi.fetchList<SavingsModel>(request: any(named: 'request')),
        ).called(1);
      });
    });
  });
}
