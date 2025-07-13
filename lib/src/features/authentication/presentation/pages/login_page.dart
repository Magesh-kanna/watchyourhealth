import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:watchyourhealth/src/core/utils/app_colors.dart';
import 'package:watchyourhealth/src/core/utils/custom_snackbar.dart';
import 'package:watchyourhealth/src/core/utils/slide_animations.dart';
import 'package:watchyourhealth/src/core/utils/string_extensions.dart';
import 'package:watchyourhealth/src/core/utils/theme_bottom_sheet.dart';
import 'package:watchyourhealth/src/features/authentication/presentation/providers/auth_provider.dart';
import 'package:watchyourhealth/src/features/authentication/presentation/widget/custom_dialog_box.dart';
import 'package:watchyourhealth/src/features/authentication/presentation/widget/language_selector.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/pages/homepage.dart';

class AllyCareLoginScreen extends ConsumerStatefulWidget {
  const AllyCareLoginScreen({super.key});

  @override
  ConsumerState<AllyCareLoginScreen> createState() =>
      _AllyCareLoginScreenState();
}

class _AllyCareLoginScreenState extends ConsumerState<AllyCareLoginScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final bool _isLoading = false;

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authprovider = ref.watch(authenticationControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                children: [
                  // Language Bar
                  SlideAnimation(
                    child: LanguageSelectorWidget(
                      onTap: () => showModalBottomSheet<Widget>(
                        builder: (BuildContext context) =>
                            const ThemeBottomSheet(),
                        context: context,
                      ),
                    ),
                  ),
                  // Main Content
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: SlideAnimation(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 64),
                                // AllyCare Logo
                                SizedBox(
                                  height: 48,
                                  child: Image.asset(
                                    'assets/logo/allycare.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.error,
                                        color: Colors.white,
                                        size: 24,
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 18),
                                // Subtitle
                                const Text(
                                  'Login or create your account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 64),
                                // Email Input
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8F9FA),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: const Color(0xFFE9ECEF),
                                      width: 1.9,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: emailTextController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your email',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                const SizedBox(height: 18),

                                /// Password Input
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8F9FA),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: const Color(0xFFE9ECEF),
                                      width: 1.9,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: passwordTextController,
                                    obscureText:
                                        authprovider.showPassword ?? false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.password,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          ref
                                              .read(
                                                authenticationControllerProvider
                                                    .notifier,
                                              )
                                              .togglePassword();
                                        },
                                        icon: Icon(
                                          authprovider.showPassword ?? false
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                // Continue Button
                                SizedBox(
                                  width: 190,
                                  child: ElevatedButton(
                                    onPressed:
                                        authprovider.isLoginPageLoading ?? false
                                        ? null
                                        : () async {
                                            if (emailTextController
                                                    .text
                                                    .isNotNullOrEmpty &&
                                                passwordTextController
                                                    .text
                                                    .isNotNullOrEmpty) {
                                              /// showing the loading circular
                                              /// in ui
                                              ref
                                                  .read(
                                                    authenticationControllerProvider
                                                        .notifier,
                                                  )
                                                  .toggleShowLoadingWhileLogin(
                                                    isLoginPageLoading: true,
                                                  );
                                              try {
                                                if (await ref
                                                    .read(
                                                      authenticationControllerProvider
                                                          .notifier,
                                                    )
                                                    .loginWithEmailPassword(
                                                      email: emailTextController
                                                          .text,
                                                      password:
                                                          passwordTextController
                                                              .text,
                                                    )) {
                                                  if (mounted &&
                                                      context.mounted) {
                                                    await showLoginSuccessDialogLottie();
                                                  }
                                                } else {
                                                  if (mounted &&
                                                      context.mounted) {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => CustomDialog(
                                                        title: 'Login Failed',
                                                        message:
                                                            'Invalid email or password. Please try again.',
                                                        icon:
                                                            Icons.error_outline,
                                                        iconColor: AppColors
                                                            .wakeYourHealthPrimary,
                                                        iconBackgroundColor:
                                                            Colors.white,
                                                        primaryButtonColor:
                                                            AppColors
                                                                .wakeYourHealthPrimary,
                                                        titleColor: AppColors
                                                            .wakeYourHealthPrimary,
                                                      ),
                                                    );
                                                  }
                                                }
                                              } catch (e) {
                                                CustomSnackBar.showError(
                                                  context,
                                                  message:
                                                      'Something went wrong while login, Please try again after some time',
                                                );
                                              } finally {
                                                /// showing the loading circular
                                                /// in ui
                                                ref
                                                    .read(
                                                      authenticationControllerProvider
                                                          .notifier,
                                                    )
                                                    .toggleShowLoadingWhileLogin(
                                                      isLoginPageLoading: false,
                                                    );
                                              }
                                            } else {
                                              CustomSnackBar.showError(
                                                context,
                                                message:
                                                    'Please enter email & password',
                                              );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF255FD5),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      elevation: 2,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Continue',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward, size: 18),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Bottom Section with Gradient
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/loginbottom_removebg.png',
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 22,
                                height: 22,
                                child: Image.asset(
                                  'assets/logo/support.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.support_agent,
                                      color: Colors.blue,
                                      size: 20,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Support',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ADD loading overlay
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> showLoginSuccessDialogLottie() async {
    if (mounted) {
      await showDialog<Widget>(
        context: context,
        builder: (context) {
          return Center(
            child: LottieBuilder.asset(
              'assets/lottie/complete_lottie.json',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.height * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              animate: true,
              alignment: Alignment.center,
              repeat: false,
              onLoaded: (composition) {
                Future.delayed(composition.duration, () {
                  ref
                      .read(authenticationControllerProvider.notifier)
                      .changeLottieStatus();
                  if (mounted && context.mounted) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    );
                  }
                });
              },
            ),
          );
        },
      );
    }
  }
}
