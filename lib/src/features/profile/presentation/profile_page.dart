import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchyourhealth/src/core/utils/app_colors.dart';
import 'package:watchyourhealth/src/features/authentication/presentation/pages/login_page.dart';
import 'package:watchyourhealth/src/features/authentication/presentation/providers/auth_provider.dart';
import 'package:watchyourhealth/src/features/profile/presentation/profile_provider.dart';
import 'package:watchyourhealth/src/features/profile/presentation/widgets/profile_header.dart';
import 'package:watchyourhealth/src/features/profile/presentation/widgets/profile_status.dart';
import 'package:watchyourhealth/src/features/profile/presentation/widgets/profile_tiles.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.watch(profileControllerProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.wakeYourHealthPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.wakeYourHealthPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 32,
          children: [
            // Profile Header Card
            ProfileHeader(profileData: profileController),

            // Profile Stats Cards
            ProfileStatus(),

            // Menu Items
            ProfileTiles(),

            // Logout Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _showLogoutDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red.shade600,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.red.shade200),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 20, color: Colors.red.shade600),
                    const SizedBox(width: 12),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // App Version
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.logout, color: Colors.red.shade600, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to logout from your account?',
            style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Consumer(
              builder: (context, WidgetRef ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    // Add your logout logic here
                    _performLogout(context, ref);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _performLogout(BuildContext context, WidgetRef ref) async {
    await ref.read(authenticationControllerProvider.notifier).logout();

    /// Navigate to login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AllyCareLoginScreen()),
      (route) => false,
    );
  }
}
