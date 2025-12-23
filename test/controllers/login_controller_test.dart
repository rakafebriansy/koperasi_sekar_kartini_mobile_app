import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/messaging/fcm_service/fcm_service.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/login/controllers/login_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../fakes/fake_auth_controller.dart';
import '../mocks/mock_api_client.dart';
import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LoginController controller;
  late FakeAuthController fakeAuth;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    Get.put<ApiHelper>(mockApi);
    Get.put<FcmService>(mockFcm);

    fakeAuth = FakeAuthController(apiHelper: Get.find<ApiHelper>());

    controller = LoginController(
      apiHelper: mockApi,
      authController: fakeAuth,
      fcmService: mockFcm,
    );
  });

  tearDown(() {
    Get.reset();
  });

  test(
    'login success for group_member navigates to GROUP_MEMBER_MAIN',
    () async {
      final user = DummyHelper.user(1);

      when(
        () => mockApi.fetch<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => user);

      when(() => mockFcm.sendToken()).thenAnswer((_) async {});

      controller.phoneCtrl.text = '08123456789';
      controller.passwordCtrl.text = 'password';

      await controller.login();

      expect(fakeAuth.currentUser, isNotNull);
      expect(fakeAuth.currentUser!.role, 'group_member');

      expect(controller.isSubmitted, false);
    },
  );

  test('login handles API exception gracefully', () async {
    when(
      () => mockApi.fetch<UserModel>(request: any(named: 'request')),
    ).thenThrow(Exception('Login failed'));

    await controller.login();

    expect(controller.isSubmitted, false);
  });

  test('login throws if role not recognized', () async {
    final user = DummyHelper.user(1);

    when(
      () => mockApi.fetch<UserModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => user);

    when(() => mockFcm.sendToken()).thenAnswer((_) async {});

    await controller.login();

    expect(controller.isSubmitted, false);
  });
}
