// lib/presentation/screens/assessment_detail_screen.dart
import 'package:flutter/material.dart';

class AssessmentDetailScreen extends StatelessWidget {
  const AssessmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Risk Assessment'),
        leading: const BackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset('assets/assessment_header.png'),
          const SizedBox(height: 20),
          const Text("What do you get ?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            children: const [
              Icon(Icons.favorite_border),
              Icon(Icons.person),
              Icon(Icons.analytics),
              Icon(Icons.report),
            ],
          ),
          const SizedBox(height: 20),
          const Text("How we do it ?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          const Text("1. Ensure you're in a well-lit space"),
          const Text("2. Allow camera access & proper position"),
          const Text("3. Avoid baggy clothes"),
          const Text("4. Follow exercise guide"),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.privacy_tip, color: Colors.green),
              SizedBox(width: 8),
              Expanded(child: Text("We do not store or share your personal data")),
            ],
          ),
        ],
      ),
    );
  }
}
