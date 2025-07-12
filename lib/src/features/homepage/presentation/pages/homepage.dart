import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchyourhealth/src/features/homepage/data/assessment_model.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/pages/assessment_detail_page.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/assessment_card.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/challenge_card.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/tab_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;

  final List<Assessment> assessments = [
    Assessment(
      id: 1,
      title: "Fitness Assessment",
      description:
          "Get Started On Your Fitness Goals With Our Physical Assessment And Vital Scan",
      buttonText: "Start",
      splashImage: "assets/images/fitness_assessment.png",
    ),
    Assessment(
      id: 2,
      title: "Health Risk Assessment",
      description:
          "Identify And Mitigate Health Risks With Precise, Proactive Assessments",
      buttonText: "Start",
      splashImage: "assets/images/health_assessment.png",
    ),
    Assessment(
      id: 3,
      title: "Mental Wellbeing",
      description: "Assess And Improve Your Mental Health With Guided Journals",
      buttonText: "Begin",
      splashImage:
          "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
    ),
    Assessment(
      id: 4,
      title: "Cardio Fitness",
      description: "Measure Your Cardio Strength With Targeted Workouts",
      buttonText: "Go",
      splashImage: "https://images.unsplash.com/photo-1554284126-aa88f22d8b74",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Greeting & Profile Icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello Jane',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[700],
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
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
                      onTap: () => setState(() => selectedIndex = 0),
                    ),
                    TabTile(
                      title: 'My Appointments',
                      index: 1,
                      selectedIndex: selectedIndex,
                      onTap: () => setState(() => selectedIndex = 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              Container(
                height: 380,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              right: 8.0,
                              left: 8.0,
                            ),
                            child: AssessmentCard(
                              assessment: assessments[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => AssessmentDetailPage(
                                      assessment: assessments[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF232F58),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
              ChallengeCard(),
            ],
          ),
        ),
      ),
    );
  }
}
