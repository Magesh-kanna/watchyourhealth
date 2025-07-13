import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/slide_animations.dart';
import 'package:watchyourhealth/src/features/appointment/data/appointment_model.dart';
import 'package:watchyourhealth/src/features/appointment/presentation/appointment_list_page.dart';
import 'package:watchyourhealth/src/features/appointment/presentation/widgets/appointment_tile.dart';

class AppointmentGrid extends StatelessWidget {
  const AppointmentGrid({super.key, required this.appointmentTiles});

  final List<AppointmentModel> appointmentTiles;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      child: Container(
        height: 380,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFF1F1F9),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: appointmentTiles
                  .map(
                    (appointmentModelData) => AppointmentTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AppointmentListPage(
                              appointments: appointmentTiles,
                            ),
                          ),
                        );
                      },
                      appointment: appointmentModelData,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        AppointmentListPage(appointments: appointmentTiles),
                  ),
                );
              },
              child: Container(
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF232F58),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(4),
                child: Text('View all', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
