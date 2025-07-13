class AuthModel {
  final bool? isLoggedIn;

  final String? uid;

  final bool? showSuccessLottie;

  final bool? showPassword;

  final bool? isLoginPageLoading;

  const AuthModel({
    this.isLoggedIn,
    this.uid,
    this.showSuccessLottie,
    this.showPassword,
    this.isLoginPageLoading,
  });

  AuthModel copyWith({
    bool? isloggedin,
    String? uid,
    bool? showlottie,
    bool? showpassword,
    bool? isLoginPageLoading,
  }) {
    return AuthModel(
      isLoggedIn: isloggedin ?? isLoggedIn,
      uid: uid ?? this.uid,
      showSuccessLottie: showlottie ?? showSuccessLottie,
      showPassword: showpassword ?? showPassword,
      isLoginPageLoading: isLoginPageLoading ?? this.isLoginPageLoading,
    );
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      isLoggedIn: json['isloggedin'] ?? false,
      uid: json['uid'] ?? '',
      showSuccessLottie: json['showlottie'] ?? false,
      showPassword: json['showpassword'] ?? false,
      isLoginPageLoading: json['isloginpageloading'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isloggedin': isLoggedIn,
      'uid': uid,
      'showlottie': showSuccessLottie,
      'showpassword': showPassword,
      'isloginpageloading': isLoginPageLoading,
    };
  }
}
