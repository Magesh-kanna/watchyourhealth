import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchyourhealth/src/core/utils/slide_animations.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/assessment_detail_page.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/providers/assessment_list_provider.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/circular_arrow_button.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/workout_card.dart';

class WorkoutSection extends ConsumerWidget {
  const WorkoutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessments =
        ref.read(assessmentListProvider).value?.assessments ?? [];

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
                    if (assessments.isNotEmpty) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              AssessmentDetailPage(assessment: assessments[0]),
                        ),
                      );
                    }
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
