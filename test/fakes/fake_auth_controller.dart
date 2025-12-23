import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

class FakeAuthController extends AuthController {
  FakeAuthController({required ApiHelper apiHelper})
    : super(apiHelper: apiHelper);

  UserModel? currentUser;

  @override
  Future<void> saveUserData({UserModel? user, String? token}) async {
    currentUser = user;
  }
}

final fakeAuth = FakeAuthController(apiHelper: ApiHelper());
