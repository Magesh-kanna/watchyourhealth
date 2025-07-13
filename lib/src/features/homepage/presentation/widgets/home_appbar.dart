import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchyourhealth/src/core/utils/app_colors.dart';
import 'package:watchyourhealth/src/core/utils/string_extensions.dart';
import 'package:watchyourhealth/src/features/profile/presentation/profile_page.dart';
import 'package:watchyourhealth/src/features/profile/presentation/profile_provider.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final profile = ref.watch(profileControllerProvider);
                return Text(
                  (profile.email ?? '').extractNameFromEmail(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.wakeYourHealthPrimary,
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              padding: EdgeInsets.all(2),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black54,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
