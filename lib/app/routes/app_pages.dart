import 'package:get/get.dart';

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
import '../modules/employee/manage_employee/bindings/employee_manage_employee_binding.dart';
import '../modules/employee/manage_employee/views/employee_manage_employee_view.dart';
import '../modules/employee/manage_report/bindings/employee_manage_report_binding.dart';
import '../modules/employee/manage_report/views/employee_manage_report_view.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/event_list/bindings/event_list_binding.dart';
import '../modules/event_list/views/event_list_view.dart';
import '../modules/group_detail/bindings/group_detail_binding.dart';
import '../modules/group_detail/views/group_detail_view.dart';
import '../modules/group_member/fund_list/bindings/group_member_fund_list_binding.dart';
import '../modules/group_member/fund_list/views/group_member_fund_list_view.dart';
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
import '../modules/loan_list/bindings/loan_list_binding.dart';
import '../modules/loan_list/views/loan_list_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manage_event/bindings/manage_event_binding.dart';
import '../modules/manage_event/views/manage_event_view.dart';
import '../modules/manage_group/bindings/manage_group_binding.dart';
import '../modules/manage_group/views/manage_group_view.dart';
import '../modules/manage_group_member_profile/bindings/manage_group_member_profile_binding.dart';
import '../modules/manage_group_member_profile/views/manage_group_member_profile_view.dart';
import '../modules/manage_loan/bindings/manage_loan_binding.dart';
import '../modules/manage_loan/views/manage_loan_view.dart';
import '../modules/manage_password/bindings/manage_password_binding.dart';
import '../modules/manage_password/views/manage_password_view.dart';
import '../modules/manage_savings/bindings/manage_savings_binding.dart';
import '../modules/manage_savings/views/manage_savings_view.dart';
import '../modules/report_detail/bindings/report_detail_binding.dart';
import '../modules/report_detail/views/report_detail_view.dart';
import '../modules/report_list/bindings/report_list_binding.dart';
import '../modules/report_list/views/report_list_view.dart';
import '../modules/savings_list/bindings/savings_list_binding.dart';
import '../modules/savings_list/views/savings_list_view.dart';
import '../modules/user_savings_list/bindings/user_savings_list_binding.dart';
import '../modules/user_savings_list/views/user_savings_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
      name: _Paths.EVENT_DETAIL,
      page: () => EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_LIST,
      page: () => EventListView(),
      binding: EventListBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_MEMBER_REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SAVINGS_LIST,
      page: () => const SavingsListView(),
      binding: SavingsListBinding(),
    ),
    GetPage(
      name: _Paths.LOAN_LIST,
      page: () => const LoanListView(),
      binding: LoanListBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_MANAGE_EMPLOYEE,
      page: () => const EmployeeManageEmployeeView(),
      binding: EmployeeManageEmployeeBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_EVENT,
      page: () => const ManageEventView(),
      binding: ManageEventBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_LIST,
      page: () => const ReportListView(),
      binding: ReportListBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_DETAIL,
      page: () => const ReportDetailView(),
      binding: ReportDetailBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_DETAIL,
      page: () => const GroupDetailView(),
      binding: GroupDetailBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_MEMBER_FUND_LIST,
      page: () => const GroupMemberFundListView(),
      binding: GroupMemberFundListBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_GROUP,
      page: () => const ManageGroupView(),
      binding: ManageGroupBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_MANAGE_REPORT,
      page: () => const EmployeeManageReportView(),
      binding: EmployeeManageReportBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_GROUP_MEMBER_PROFILE,
      page: () => const ManageGroupMemberProfileView(),
      binding: ManageGroupMemberProfileBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_LOAN,
      page: () => const ManageLoanView(),
      binding: ManageLoanBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_SAVINGS,
      page: () => const ManageSavingsView(),
      binding: ManageSavingsBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_PASSWORD,
      page: () => const ManagePasswordView(),
      binding: ManagePasswordBinding(),
    ),
    GetPage(
      name: _Paths.USER_SAVINGS_LIST,
      page: () => const UserSavingsListView(),
      binding: UserSavingsListBinding(),
    ),
  ];
}
