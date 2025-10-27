import 'package:get/get.dart';

import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/tabs/group/bindings/main_tabs_group_binding.dart';
import '../modules/main/tabs/group/views/main_tabs_group_view.dart';
import '../modules/main/tabs/home/bindings/main_tabs_home_binding.dart';
import '../modules/main/tabs/home/views/main_tabs_home_view.dart';
import '../modules/main/tabs/profile/bindings/main_tabs_profile_binding.dart';
import '../modules/main/tabs/profile/views/main_tabs_profile_view.dart';
import '../modules/main/views/main_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
      children: [
        GetPage(
          name: _Paths.MAIN_TABS_HOME,
          page: () => const MainTabsHomeView(),
          binding: MainTabsHomeBinding(),
        ),
        GetPage(
          name: _Paths.MAIN_TABS_PROFILE,
          page: () => const MainTabsProfileView(),
          binding: MainTabsProfileBinding(),
        ),
        GetPage(
          name: _Paths.MAIN_TABS_GROUP,
          page: () => const MainTabsGroupView(),
          binding: MainTabsGroupBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MEETING_DETAIL,
      page: () => EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
