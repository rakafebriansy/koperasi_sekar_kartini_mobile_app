import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fake_async/fake_async.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/employee/controllers/employee_main_tabs_employee_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

import '../fakes/fake_auth_controller.dart';
import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.reset();
    Get.testMode = true;
  });

  test('fetchListEmployee sukses → data terisi & isFetching false', () async {
    when(
      () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => [DummyHelper.user(1), DummyHelper.user(2)]);

    final controller = EmployeeMainTabsEmployeeController(
      apiHelper: mockApi,
      authController: Get.put(fakeAuth),
    );

    await controller.fetchListEmployee();

    expect(controller.isFetching, false);
    expect(controller.users.length, 2);
    expect(controller.users.first.name, DummyHelper.user(1).name);
  });

  test('fetchListEmployee gagal → data kosong & isFetching false', () async {
    when(
      () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
    ).thenThrow(Exception('API Error'));

    final controller = EmployeeMainTabsEmployeeController(
      apiHelper: mockApi,
      authController: Get.put(fakeAuth),
    );

    await controller.fetchListEmployee();

    expect(controller.isFetching, false);
    expect(controller.users.isEmpty, true);
  });

  test('onSearchChanged membatalkan debounce sebelumnya', () {
    fakeAsync((async) {
      final controller = EmployeeMainTabsEmployeeController(
        apiHelper: mockApi,
        authController: Get.put(fakeAuth),
      );

      controller.onSearchChanged('a');

      async.elapse(const Duration(milliseconds: 10));

      controller.onSearchChanged('ab');

      async.elapse(const Duration(seconds: 1));
    });
  });
}
