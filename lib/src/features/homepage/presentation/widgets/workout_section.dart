import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/slide_animations.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/circular_arrow_button.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/workout_card.dart';

class WorkoutSection extends StatefulWidget {
  const WorkoutSection({super.key});

  @override
  State<WorkoutSection> createState() => _WorkoutSectionState();
}

class _WorkoutSectionState extends State<WorkoutSection> {
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      child: Column(
        children: [
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('Workout Routines', style: TextStyle(fontSize: 18)),
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
          WorkoutCard(),
        ],
      ),
    );
  }
}
