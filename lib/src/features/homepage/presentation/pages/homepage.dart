import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchyourhealth/src/core/utils/slide_animations.dart';
import 'package:watchyourhealth/src/features/appointment/data/appointment_model.dart';
import 'package:watchyourhealth/src/features/appointment/presentation/widgets/appointment_grid.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/providers/assessment_list_provider.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/widgets/assessment_grid.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/provider/selected_tab_provider.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/challenge_section.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/home_appbar.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/tab_tile.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/workout_section.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  final List<AppointmentModel> appointments = [
    AppointmentModel(
      title: 'Cancer 2nd Opinion',
      imageiconurl: 'assets/images/canceropinion.png',
      // Doctor with ribbon icon
      backgroundcolor: '#D1E4FF',
      iconcolor: '#4E88FF',
    ),
    AppointmentModel(
      title: 'Physiotherapy Appointment',
      imageiconurl: 'assets/images/physio.png',
      // Physio massage icon
      backgroundcolor: '#F0D6FF',
      iconcolor: '#9C27B0',
    ),
    AppointmentModel(
      title: 'Fitness Appointment',
      imageiconurl: 'assets/images/fitnessicon.png',
      // Dumbbell icon
      backgroundcolor: '#FFE0D1',
      iconcolor: '#FF5722',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedTabIndexProvider);
    final assessments =
        ref.watch(assessmentListProvider).value?.assessments ?? [];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: SlideAnimation(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Greeting & Profile Icon
                  HomeAppbar(),
                  const SizedBox(height: 24),

                  // Segmented assessment and appointment Tabs
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F9),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        TabTile(
                          title: 'My Assessments',
                          index: 0,
                          selectedIndex: selectedIndex,
                          onTap: () {
                            print('selectedIndex is called $selectedIndex');
                            ref.read(selectedTabIndexProvider.notifier).state =
                                0;
                          },
                        ),
                        TabTile(
                          title: 'My Appointments',
                          index: 1,
                          selectedIndex: selectedIndex,
                          onTap: () {
                            ref.read(selectedTabIndexProvider.notifier).state =
                                1;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  (selectedIndex == 0)
                      ? AssessmentGrid(assessments: assessments)
                      : AppointmentGrid(appointmentTiles: appointments),
                  const SizedBox(height: 6),

                  /// Challenges Section
                  ChallengeSection(),

                  /// Workout Section
                  WorkoutSection(),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
