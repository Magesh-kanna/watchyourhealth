import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watchyourhealth/src/features/profile/data/models/profile_model.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  ProfileModel build() {
    return fetchUserData();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to fetch user email and uid from Firebase and add to state
  ProfileModel fetchUserData() {
    final User? user = _auth.currentUser;
    if (user != null) {
      state = ProfileModel(uid: user.uid, email: user.email ?? '');
      return ProfileModel(uid: user.uid, email: user.email ?? '');
    } else {
      return ProfileModel.empty();
    }
  }
}
