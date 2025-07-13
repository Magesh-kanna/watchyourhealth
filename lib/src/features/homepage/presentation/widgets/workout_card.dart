import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/assessment_detail_page.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/providers/assessment_list_provider.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final assessments =
            ref.watch(assessmentListProvider).value?.assessments ?? [];
        return InkWell(
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
          child: Container(
            margin: const EdgeInsets.all(16),
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Row(
              children: [
                // Left image section
                Expanded(
                  child: Container(
                    width: 140,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE6C7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        bottomLeft: Radius.circular(28),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        bottomLeft: Radius.circular(28),
                      ),
                      child: Image.asset(
                        'assets/images/ladyworkout.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Right content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Sweat Starter',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Full Body',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        // Category Tag
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: Text(
                            'Lose Weight',
                            style: GoogleFonts.poppins(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        // Difficulty
                        RichText(
                          text: TextSpan(
                            text: 'Difficulty : ',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Medium',
                                style: GoogleFonts.poppins(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
