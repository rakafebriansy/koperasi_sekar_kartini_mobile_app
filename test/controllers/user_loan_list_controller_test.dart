import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/user_loan_list/controllers/user_loan_list_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockApiHelper mockApi;
  late UserLoanListController controller;

  late List<UserModel> dummyUsers;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    mockApi = MockApiHelper();
    controller = UserLoanListController(apiHelper: mockApi);

    dummyUsers = [
      DummyHelper.user(1),
      DummyHelper.user(2),
    ];
  });

  group('UserLoanListController', () {
    test('fetchListMember success', () async {
      when(() => mockApi.fetchList<UserModel>(
            request: any(named: 'request'),
          )).thenAnswer((_) async => dummyUsers);

      await controller.fetchListMember();

      expect(controller.isFetching, false);
      expect(controller.members.length, 2);

      verify(() => mockApi.fetchList<UserModel>(
            request: any(named: 'request'),
          )).called(1);
    });

    test('fetchListMember handles error', () async {
      when(() => mockApi.fetchList<UserModel>(
            request: any(named: 'request'),
          )).thenThrow(Exception('API error'));

      await controller.fetchListMember();

      expect(controller.isFetching, false);
      expect(controller.members.isEmpty, true);

      verify(() => mockApi.fetchList<UserModel>(
            request: any(named: 'request'),
          )).called(1);
    });

    test('onSearchChanged triggers fetch after debounce', () {
      fakeAsync((async) {
        when(() => mockApi.fetchList<UserModel>(
              request: any(named: 'request'),
            )).thenAnswer((_) async => dummyUsers);

        controller.onSearchChanged('andi');

        // sebelum debounce selesai
        async.elapse(const Duration(milliseconds: 500));
        verifyNever(() => mockApi.fetchList<UserModel>(
              request: any(named: 'request'),
            ));

        // lewat 1 detik
        async.elapse(const Duration(seconds: 1));

        verify(() => mockApi.fetchList<UserModel>(
              request: any(named: 'request'),
            )).called(1);
      });
    });

    test('onSearchChanged cancels previous debounce', () {
      fakeAsync((async) {
        when(() => mockApi.fetchList<UserModel>(
              request: any(named: 'request'),
            )).thenAnswer((_) async => dummyUsers);

        controller.onSearchChanged('a');
        async.elapse(const Duration(milliseconds: 300));

        controller.onSearchChanged('andi');

        async.elapse(const Duration(seconds: 1));

        verify(() => mockApi.fetchList<UserModel>(
              request: any(named: 'request'),
            )).called(1);
      });
    });
  });
}
