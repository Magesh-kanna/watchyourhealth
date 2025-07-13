// profile_model.dart
class ProfileModel {
  final String? uid;
  final String? email;

  final bool? isEmptyProfile;

  const ProfileModel({this.uid, this.email, this.isEmptyProfile});

  // Empty profile for unauthenticated state
  factory ProfileModel.empty() {
    return const ProfileModel(isEmptyProfile: true);
  }
}
