import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/secure_storage/token_manager.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class AuthController extends GetxController {
  final RxBool _isRefreshing = false.obs;
  bool get isRefreshing => _isRefreshing.value;

  final Rx<UserModel?> _currentUser = Rxn();
  UserModel? get currentUser => _currentUser.value;

  Rxn<AuthState> authState = Rxn();

  bool get isAuthenticated => authState.value == AuthState.authenticated;

  static AuthController find = Get.find<AuthController>();

  final TokenManager tokenManager = TokenManager();
  bool get isUnauthenticated => !isAuthenticated;

  @override
  void onReady() {
    ever(authState, authChanged);
    authState.value = AuthState.initial;
    super.onReady();
  }

  Future<void> authChanged(AuthState? state) async {
    debugPrint(state.toString());
    switch (state) {
      case AuthState.unauthenticated:
        Get.offAllNamed(Routes.LOGIN);
        break;
      case AuthState.initial:
        await refreshToken();
        break;
      case AuthState.authenticated:
        Get.offAllNamed(currentUser?.role == 'group_member' ? Routes.GROUP_MEMBER_MAIN : Routes.EMPLOYEE_MAIN);
        break;
      default:
      //TODO: Loading screen
    }
  }

  Future<void> refreshToken() async {
    try {
      final user = await ApiHelper.fetch<UserModel>(
        request: (api) => api.refreshToken(),
      );
      _currentUser.value = user;
      authState.value = AuthState.authenticated;
      return;
    } catch (e) {
      authState.value = AuthState.unauthenticated;
    }
  }

  Future<void> clearData() async {
    try {
      await tokenManager.deleteToken();
      _currentUser.value = null;

      authState.value = AuthState.unauthenticated;
    } catch (e) {
      ErrorHelper.handleError(e);
    }
  }

  Future<void> saveUserData({required UserModel user, String? token}) async {
    if (token != null) await tokenManager.setToken(token);
    _currentUser.value = user;
  }

  Future<void> logout() async {
    try {
      //TODO: Apakah anda yakin?
      await ApiHelper.fetchNonReturnable(request: (api) => api.logout());
      authState.value = AuthState.initial;
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error', 'Gagal logout');
    } finally {
      _currentUser.value = null;
    }
  }
}

enum AuthState { initial, unauthenticated, authenticated }
