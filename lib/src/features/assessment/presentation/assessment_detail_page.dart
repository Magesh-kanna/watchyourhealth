import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchyourhealth/src/core/utils/context_extension.dart';
import 'package:watchyourhealth/src/core/utils/string_extensions.dart';
import 'package:watchyourhealth/src/features/assessment/data/assessment_model.dart';

class AssessmentDetailPage extends StatelessWidget {
  const AssessmentDetailPage({super.key, required this.assessment});

  final Assessment assessment;

  @override
  Widget build(BuildContext context) {
    final randomBannerColor = context.randomShadeColor;
    return Scaffold(
      backgroundColor: randomBannerColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with image and title
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 48,
                    left: 26,
                    right: 26,
                    bottom: 24,
                  ),
                  decoration: BoxDecoration(color: randomBannerColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(width: 24),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  assessment.title,
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.timer_outlined,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        assessment.duration,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Image
                          Hero(
                            tag: assessment.id,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: assessment.splashImage.isNetworkImage
                                  ? Image.network(
                                      assessment.splashImage,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Icon(Icons.error),
                                    )
                                  : Image.asset(
                                      assessment.splashImage,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Icon(Icons.error),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // What do you get?
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What do you get ?",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _featureIcon(
                              title: "Key Body\nVitals",
                              imageURL: 'assets/images/blueheart.png',
                            ),
                            _featureIcon(
                              title: "Posture\nAnalysis",
                              imageURL: 'assets/images/posteranalysis.png',
                            ),
                            _featureIcon(
                              title: "Body\nComposition",
                              imageURL: 'assets/images/bodycomposition.png',
                            ),
                            _featureIcon(
                              title: "Instant\nReports",
                              imageURL: 'assets/images/instantreport.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // How we do it?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How we do it ?",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: assessment.splashImage.isNetworkImage
                              ? Image.network(
                                  assessment.splashImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                )
                              : Image.asset(
                                  assessment.splashImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD7F5E8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.verified_user, color: Colors.green),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "We do not store or share your personal data",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Checklist
                        _instructionText(
                          "1. Ensure that you are in a well-lit space",
                        ),
                        _instructionText(
                          "2. Allow camera access and place your device against a stable object or wall",
                        ),
                        _instructionText("3. Avoid wearing baggy clothes"),
                        _instructionText(
                          "4. Make sure you exercise as per the instruction provided by the trainer",
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureIcon({required String title, required String imageURL}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 28,
          child: Image.asset(width: 24, imageURL),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 12),
        ),
      ],
    );
  }

  Widget _instructionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${text.split('.').first}.',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(text.substring(text.indexOf('.') + 1).trim())),
        ],
      ),
    );
  }
}
