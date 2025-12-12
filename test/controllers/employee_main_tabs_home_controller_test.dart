import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/home/controllers/employee_main_tabs_home_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock_api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;

  late MockApiHelper mockApi;

  setUp(() {
    Get.reset();
    mockApi = MockApiHelper();
  });

  test('fetchListEvent mengambil data event dari API dan mengisi state', () async {
    when(() => mockApi.fetchList<EventModel>(
          request: any(named: 'request'),
        )).thenAnswer((_) async {
      return [
        DummyHelper.ev(1)
      ];
    });

    final controller = EmployeeMainTabsHomeController(apiHelper: mockApi);
    controller.onInit();

    await Future.delayed(Duration.zero);

    expect(controller.isFetchingEvents, false);
    expect(controller.events.length, 1);
    expect(controller.events.first.name, DummyHelper.ev(1).name);
  });
}
