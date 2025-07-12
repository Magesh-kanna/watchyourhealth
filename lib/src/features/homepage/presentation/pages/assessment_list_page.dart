import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/features/homepage/data/assessment_model.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/pages/assessment_detail_page.dart';
import 'package:watchyourhealth/src/features/homepage/presentation/widgets/assessment_card.dart';

class AssessmentListPage extends StatelessWidget {
  const AssessmentListPage({super.key, required this.assessments});

  final List<Assessment> assessments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, right: 8.0, left: 8.0),
              child: AssessmentCard(
                assessment: assessments[index],
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          AssessmentDetailPage(assessment: assessments[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
