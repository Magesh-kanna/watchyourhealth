import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/slide_animations.dart';
import 'package:watchyourhealth/src/features/homepage/data/assessment_model.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/pages/assessment_detail_page.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/assessment_card.dart';

class AssessmentGrid extends StatelessWidget {
  const AssessmentGrid({super.key, required this.assessments});

  final List<Assessment> assessments;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      child: Container(
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
              child: Text('View all', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
