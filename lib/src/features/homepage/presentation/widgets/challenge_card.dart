import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/assessment_detail_page.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/providers/assessment_list_provider.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFC1EAD1),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        children: [
          // Left Column
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Challenge!",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.teal[900],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal[700],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      'Push Up 20x',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: 0.5,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFFF88A5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '10',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '/20 Complete',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Consumer(
                    builder: (context, ref, child) {
                      final assessments =
                          ref.read(assessmentListProvider).value?.assessments ??
                          [];

                      return ElevatedButton.icon(
                        onPressed: () {
                          if (assessments.isNotEmpty) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => AssessmentDetailPage(
                                  assessment: assessments[0],
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 22,
                        ),
                        label: Text(
                          "Continue",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFF255FD5),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Right Image
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/ladypushup.png",
                width: 120,
                height: 120,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
