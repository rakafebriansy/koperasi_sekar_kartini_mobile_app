import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/loan_list/controllers/loan_list_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockApiHelper mockApi;
  late LoanListController controller;
  late UserModel dummyUser;
  late LoanModel dummyLoan;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    mockApi = MockApiHelper();
    dummyUser = DummyHelper.user(1);
    dummyLoan = DummyHelper.lo(1);

    controller = LoanListController(apiHelper: mockApi);
  });

  group('LoanListController', () {
    test('onInit sets member and fetches loans', () async {
      when(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyLoan]);

      controller.memberRx.value = dummyUser;
      await controller.fetchListLoan(memberId: dummyUser.id);

      expect(controller.member?.id, dummyUser.id);
      expect(controller.isFetching, false);
      expect(controller.loans.length, 1);
      expect(controller.loans.first.nominal, DummyHelper.lo(1).nominal);

      verify(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchListLoan updates loans and isFetching', () async {
      when(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyLoan]);

      await controller.fetchListLoan(memberId: dummyUser.id);

      expect(controller.isFetching, false);
      expect(controller.loans.length, 1);
      expect(controller.loans.first.id, dummyLoan.id);

      verify(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('onSearchChanged calls fetchListLoan after debounce', () async {
      when(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyLoan]);

      controller.onSearchChanged('test');

      await Future.delayed(const Duration(seconds: 2));

      expect(controller.loans.length, 1);
      expect(controller.isFetching, false);

      verify(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchListLoan handles API exception gracefully', () async {
      when(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).thenThrow(Exception('API error'));

      await controller.fetchListLoan(memberId: dummyUser.id);

      expect(controller.isFetching, false);
      expect(controller.loans.length, 0);
      verify(
        () => mockApi.fetchList<LoanModel>(request: any(named: 'request')),
      ).called(1);
    });
  });
}
