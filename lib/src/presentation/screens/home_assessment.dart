import 'package:flutter/material.dart';

class HomeAssessmentScreen extends StatelessWidget {
  const HomeAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Text(
                    "Hello Jane",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 24),

              // Tab Toggle
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E9F0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTab("My Assessments", true),
                    _buildTab("My Appointments", false),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Assessment Cards
              _buildAssessmentCard(
                image: "assets/images/fitness.png",
                title: "Fitness Assessment",
                description:
                    "Get started on your fitness goals with our physical assessment and vital scan",
                color: const Color(0xFFFFEFE0),
              ),
              const SizedBox(height: 16),
              _buildAssessmentCard(
                image: "assets/images/health.png",
                title: "Health Risk Assessment",
                description:
                    "Identify and mitigate health risks with proactive assessments",
                color: const Color(0xFFE9F8F2),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("View all"),
                ),
              ),
              const SizedBox(height: 12),

              // Challenges
              _buildSectionHeader("Challenges"),
              const SizedBox(height: 8),
              _buildChallengeCard(),
              const SizedBox(height: 20),

              // Workout Routines
              _buildSectionHeader("Workout Routines"),
              const SizedBox(height: 8),
              _buildWorkoutCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool selected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: selected ? Colors.black : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildAssessmentCard({
    required String image,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 60, width: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(description,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(0, 30),
                  ),
                  child: const Text("Start", style: TextStyle(fontSize: 12)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildChallengeCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFDDF1E6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/pushup.png", height: 60),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Today’s Challenge!", style: TextStyle(fontSize: 14)),
                const Text("Push Up 20x"),
                const SizedBox(height: 6),
                LinearProgressIndicator(value: 0.5, color: Colors.green),
                const SizedBox(height: 6),
                const Text("10/20 Complete", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 6),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Continue", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              blurRadius: 8, offset: Offset(0, 4), color: Colors.black12),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/workout.png",
                height: 60, width: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Sweat Starter", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Full Body  •  Medium",
                  style: TextStyle(color: Colors.black54, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
