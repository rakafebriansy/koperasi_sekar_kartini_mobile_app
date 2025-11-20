import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/detail/bindings/employee_employee_detail_binding.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/detail/views/employee_employee_detail_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/loan_list/bindings/group_member_loan_list_binding.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/loan_list/views/group_member_loan_list_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/savings_list/bindings/group_member_savings_list_binding.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/savings_list/views/group_member_savings_list_view.dart';

import '../modules/employee/main/bindings/employee_main_binding.dart';
import '../modules/employee/main/tabs/employee/bindings/employee_main_tabs_employee_binding.dart';
import '../modules/employee/main/tabs/employee/views/employee_main_tabs_employee_view.dart';
import '../modules/employee/main/tabs/group/bindings/employee_main_tabs_group_binding.dart';
import '../modules/employee/main/tabs/group/views/employee_main_tabs_group_view.dart';
import '../modules/employee/main/tabs/home/bindings/employee_main_tabs_home_binding.dart';
import '../modules/employee/main/tabs/home/views/employee_main_tabs_home_view.dart';
import '../modules/employee/main/tabs/profile/bindings/employee_main_tabs_profile_binding.dart';
import '../modules/employee/main/tabs/profile/views/employee_main_tabs_profile_view.dart';
import '../modules/employee/main/views/employee_main_view.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/group_member/main/bindings/group_member_main_binding.dart';
import '../modules/group_member/main/tabs/group/bindings/group_member_main_tabs_group_binding.dart';
import '../modules/group_member/main/tabs/group/views/group_member_main_tabs_group_view.dart';
import '../modules/group_member/main/tabs/home/bindings/main_tabs_home_binding.dart';
import '../modules/group_member/main/tabs/home/views/group_member_main_tabs_home_view.dart';
import '../modules/group_member/main/tabs/profile/bindings/group_member_main_tabs_profile_binding.dart';
import '../modules/group_member/main/tabs/profile/views/group_member_main_tabs_profile_view.dart';
import '../modules/group_member/main/views/group_member_main_view.dart';
import '../modules/group_member/register/bindings/register_binding.dart';
import '../modules/group_member/register/views/register_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.GROUP_MEMBER_SAVINGS_LIST;

  static final routes = [
    GetPage(
      name: _Paths.EMPLOYEE_MAIN,
      page: () => const EmployeeMainView(),
      binding: EmployeeMainBinding(),
      children: [
        GetPage(
          name: _Paths.EMPLOYEE_MAIN_TABS_HOME,
          page: () => const EmployeeMainTabsHomeView(),
          binding: EmployeeMainTabsHomeBinding(),
        ),
        GetPage(
          name: _Paths.EMPLOYEE_MAIN_TABS_GROUP,
          page: () => const EmployeeMainTabsGroupView(),
          binding: EmployeeMainTabsGroupBinding(),
        ),
        GetPage(
          name: _Paths.EMPLOYEE_MAIN_TABS_EMPLOYEE,
          page: () => const EmployeeMainTabsEmployeeView(),
          binding: EmployeeMainTabsEmployeeBinding(),
        ),
        GetPage(
          name: _Paths.EMPLOYEE_MAIN_TABS_PROFILE,
          page: () => const EmployeeMainTabsProfileView(),
          binding: EmployeeMainTabsProfileBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.GROUP_MEMBER_MAIN,
      page: () => GroupMemberMainView(),
      binding: GroupMemberMainBinding(),
      children: [
        GetPage(
          name: _Paths.GROUP_MEMBER_MAIN_TABS_HOME,
          page: () => const GroupMemberMainTabsHomeView(),
          binding: GroupMemberMainTabsHomeBinding(),
        ),
        GetPage(
          name: _Paths.GROUP_MEMBER_MAIN_TABS_PROFILE,
          page: () => const GroupMemberMainTabsProfileView(),
          binding: GroupMemberMainTabsProfileBinding(),
        ),
        GetPage(
          name: _Paths.GROUP_MEMBER_MAIN_TABS_GROUP,
          page: () => const GroupMemberMainTabsGroupView(),
          binding: GroupMemberMainTabsGroupBinding(),
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
      name: _Paths.GROUP_MEMBER_REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_MEMBER_SAVINGS_LIST,
      page: () => const GroupMemberSavingsListView(),
      binding: GroupMemberSavingsListBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_MEMBER_LOAN_LIST,
      page: () => const GroupMemberLoanListView(),
      binding: GroupMemberLoanListBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_EMPLOYEE_DETAIL,
      page: () => const EmployeeEmployeeDetailView(),
      binding: EmployeeEmployeeDetailBinding(),
    ),
  ];
}
