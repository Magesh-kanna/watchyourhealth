import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchyourhealth/src/core/constants/app_constants.dart';
import 'package:watchyourhealth/src/core/utils/string_extensions.dart';
import 'package:watchyourhealth/src/features/authentication/presentation/pages/login_page.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Check for your specific key - replace 'user_token' with your actual key
      final String? uid = prefs.getString(AppConstants.uidKey);

      // Add a small delay for better UX (optional)
      await Future.delayed(const Duration(milliseconds: 1500));

      if (mounted) {
        if (uid.isNotNullOrEmpty) {
          // User is logged in, navigate to homepage
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) =>
                  const Homepage(), // Replace with your homepage
            ),
          );
        } else {
          // User is not logged in, navigate to login page
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const AllyCareLoginScreen(),
            ),
          );
        }
      }
    } catch (e, s) {
      print("Error checking login status: $e");
      print("Stacktrace: $s");
      // On error, default to login page
      if (mounted) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => const AllyCareLoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          'assets/lottie/loader.json',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.height * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          animate: true,
          frameRate: FrameRate(90),
          alignment: Alignment.center,
          repeat: false,
          onLoaded: (composition) {},
        ),
      ),
    );
  }
}
