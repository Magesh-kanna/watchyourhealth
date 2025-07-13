import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/theme_bottom_sheet.dart';
import 'package:watchyourhealth/src/features/authentication/presentation/widget/language_selector.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/pages/homepage.dart';

class AllyCareLoginScreen extends StatelessWidget {
  const AllyCareLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Language Bar
            LanguageSelectorWidget(
              onTap: () => showModalBottomSheet<Widget>(
                builder: (BuildContext context) => const ThemeBottomSheet(),
                context: context,
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
                  child: Column(
                    children: [
                      const SizedBox(height: 64),
                      // AllyCare Logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                        ],
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
                        child: const TextField(
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
                      const SizedBox(height: 32),
                      // Continue Button
                      SizedBox(
                        width: 190,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const Homepage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF255FD5),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 2,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                      const Spacer(),
                    ],
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
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
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
    );
  }
}
