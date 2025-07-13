import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watchyourhealth/src/core/helper/shared_preferences_helper.dart';
import 'package:watchyourhealth/src/features/authentication/data/auth_model.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationController extends _$AuthenticationController {
  @override
  AuthModel build() => AuthModel(isLoggedIn: false);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void togglePassword() {
    state = state.copyWith(showpassword: !(state.showPassword ?? false));
  }

  Future<bool> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid ?? '';

      // Save UID to SharedPreferences
      await SharedPrefsHelper.saveUid(uid);

      // Update provider state
      state = state.copyWith(isloggedin: true, uid: uid, showlottie: true);

      return true;
    } catch (e) {
      print('Login Error: \$e');
      return false;
    }
  }

  void changeLottieStatus() {
    // Optional: delay hiding lottie
    state = state.copyWith(showlottie: false);
  }

  void toggleShowLoadingWhileLogin({required bool isLoginPageLoading}) {
    state = state.copyWith(isLoginPageLoading: isLoginPageLoading);
  }

  Future<void> logout() async {
    await _auth.signOut();
    await SharedPrefsHelper.clearAll();
  }

  Future<void> checkAuthStatus() async {
    final user = _auth.currentUser;
    final uid = user?.uid ?? await SharedPrefsHelper.getUid();

    final isLoggedIn = uid.isNotEmpty;

    state = state.copyWith(isloggedin: isLoggedIn, uid: uid);
  }
}
