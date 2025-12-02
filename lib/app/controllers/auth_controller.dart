import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/secure_storage/token_manager.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class AuthController extends GetxController {
  // final api = Get.find<ApiService>();

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
    authState.value = AuthState.none;
    super.onReady();
  }

  Future<void> authChanged(AuthState? state) async {
    switch (state) {
      case AuthState.none:
      case AuthState.unauthenticated:
        Get.offAllNamed(Routes.LOGIN);
        break;
      case AuthState.initial:
        await fetchCurrentUser();
        break;
      case AuthState.authenticated:
        Get.offAllNamed(Routes.GROUP_MEMBER_MAIN);
        break;
      default:
        Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> fetchCurrentUser() async {
    try {
      String? token = await tokenManager.getToken();
      // Map<String, dynamic>? data = await api.getCurrentUser();
      // currentUser.value = UserModel.fromJson(data['user']);
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

  Future<UserModel?> refreshUserFromApi() async {
    _isRefreshing.value = true;
    // ApiClient? apiClient = await createApiClient();

    // if (apiClient == null) {
    //   _isRefreshing.value = false;
    //   throw Exception('apiClient is null');
    // }

    // ProfileResponse response = await apiClient.getProfile();

    // if (response.data == null) {
    //   return null;
    // }

    // await saveUserData(member: response.data!);

    // _isRefreshing.value = false;
    // return response.data;
  }

  Future<void> logout() async {
    try {
      authState.value = AuthState.initial;
      Get.offAllNamed(Routes.LOGIN);
    } catch (_) {
      Get.snackbar('Error', 'Gagal logout');
    } finally {
      _currentUser.value = null;
    }
  }
}

enum AuthState { initial, none, unauthenticated, authenticated }
