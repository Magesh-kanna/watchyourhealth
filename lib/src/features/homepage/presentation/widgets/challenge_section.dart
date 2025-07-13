import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/slide_animations.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/challenge_card.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/circular_arrow_button.dart';

class ChallengeSection extends StatefulWidget {
  const ChallengeSection({super.key});

  @override
  State<ChallengeSection> createState() => _ChallengeSectionState();
}

class _ChallengeSectionState extends State<ChallengeSection> {
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('Challenges', style: TextStyle(fontSize: 18)),
                const Spacer(),
                Text(
                  'View all',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                const SizedBox(width: 12),
                CircularArrowButton(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(
                    //     builder: (context) => AssessmentDetailPage(
                    //       assessment: assessments[0],
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          ChallengeCard(),
        ],
      ),
    );
  }
}
