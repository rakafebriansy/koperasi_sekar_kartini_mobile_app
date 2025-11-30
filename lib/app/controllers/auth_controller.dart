import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  // final api = Get.find<ApiService>();

  Rx<UserModel?> currentUser = Rx(null);

  Rxn<AuthState> authState = Rxn();

  bool get isAuthenticated => authState.value == AuthState.authenticated;

  static AuthController find = Get.find<AuthController>();

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
      // Map<String, dynamic>? data = await api.getCurrentUser();
      // currentUser.value = UserModel.fromJson(data['user']);
      authState.value = AuthState.authenticated;
      return;
    } catch (e) {
      authState.value = AuthState.unauthenticated;
    }
  }

  Future<void> logout() async {
    try {
      authState.value = AuthState.initial;
      Get.offAllNamed(Routes.LOGIN);
    } catch (_) {
      Get.snackbar('Error', 'Gagal logout');
    } finally {
      currentUser.value = null;
    }
  }
}

enum AuthState { initial, none, unauthenticated, authenticated }
