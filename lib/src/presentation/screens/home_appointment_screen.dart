// lib/presentation/screens/home_appointment_screen.dart
import 'package:flutter/material.dart';

class HomeAppointmentScreen extends StatelessWidget {
  const HomeAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Row(
                children: [
                  const Text("Hello Jane", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Icon(Icons.notifications_outlined),
                ],
              ),
              const SizedBox(height: 16),
              ToggleButtons(
                isSelected: [false, true],
                borderRadius: BorderRadius.circular(30),
                onPressed: (_) {},
                children: const [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("My Assessments")),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("My Appointments")),
                ],
              ),
              const SizedBox(height: 20),
              _buildAppointmentCard("Cancer 2nd Opinion"),
              _buildAppointmentCard("Physiotherapy Appointment"),
              _buildAppointmentCard("Fitness Appointment"),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text("View all")),
              ),
              const SizedBox(height: 10),
              const Text("Challenges", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildChallengeCard(),
              const Text("Workout Routines", style: TextStyle(fontWeight: FontWeight.bold)),
              _buildWorkoutCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(String title) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_month),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  Widget _buildChallengeCard() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.fitness_center),
        title: const Text("Today's Challenge!"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Push Up 20x"),
            LinearProgressIndicator(value: 0.5),
            const Text("10/20 Complete"),
          ],
        ),
        trailing: const Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _buildWorkoutCard() {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.pink),
        title: const Text("Sweat Starter"),
        subtitle: const Text("Full Body • Medium"),
      ),
    );
  }
}
