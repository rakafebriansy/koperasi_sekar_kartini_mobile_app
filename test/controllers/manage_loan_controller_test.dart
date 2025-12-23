import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_loan/controllers/manage_loan_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';

import '../mocks/mock_api_helper.dart';
import '../fakes/fake_auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ManageLoanController controller;

  late UserModel dummyUser;
  late LoanModel dummyLoan;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    dummyUser = DummyHelper.user(1);

    dummyLoan = DummyHelper.lo(1);

    controller = ManageLoanController(
      apiHelper: mockApi,
      authController: fakeAuth,
    );
  });

  group('ManageLoanController', () {
    test('selectLoanType sets selectedLoanType correctly', () {
      controller.selectLoanType('Pinjaman Biasa');
      expect(controller.selectedLoanType, LoanType.pinjamanBiasa);
    });

    test('createLoan success', () async {
      controller
        ..amountCtrl.text = '50000'
        ..dateCtrl.text = '02/2024';

      controller
        ..selectLoanType('Pinjaman Biasa')
        ..userRx.value = dummyUser;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.createLoan();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('createLoan fails when loan type is null', () async {
      controller
        ..amountCtrl.text = '50000'
        ..dateCtrl.text = '02/2024'
        ..userRx.value = dummyUser;

      await controller.createLoan();

      expect(controller.isSubmitted, false);
    });

    test('updateStatus success', () async {
      controller
        ..loanRx.value = dummyLoan
        ..selectLoanType('Pinjaman Biasa');

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.updateStatus();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('deleteLoan success', () async {
      controller.loanRx.value = dummyLoan;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.deleteLoan();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('submitButton triggers createLoan when action is create', () async {
      controller
        ..actionRx.value = ActionType.create
        ..amountCtrl.text = '50000'
        ..dateCtrl.text = '02/2024'
        ..selectLoanType('Pinjaman Biasa')
        ..userRx.value = dummyUser;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.submitButton();

      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('submitButton triggers updateStatus when action is update', () async {
      controller
        ..actionRx.value = ActionType.update
        ..loanRx.value = dummyLoan
        ..selectLoanType('Pinjaman Biasa');

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.submitButton();

      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });
  });
}
