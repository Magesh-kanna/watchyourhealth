import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/string_extensions.dart';
import 'package:watchyourhealth/src/features/profile/data/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.profileData});

  final ProfileModel profileData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4A90E2).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),

          // User Email
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Firebase UID: ${profileData.uid}",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // User Name
          Text(
            (profileData.email ?? '').extractNameFromEmail(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
