import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchyourhealth/src/core/utils/string_extensions.dart';
import 'package:watchyourhealth/src/features/appointment/data/appointment_model.dart';

class AppointmentTile extends StatelessWidget {
  const AppointmentTile({
    super.key,
    required this.appointment,
    required this.onTap,
  });

  final AppointmentModel appointment;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appointment.background,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: appointment.imageiconurl.isNetworkImage
                  ? Image.network(
                      appointment.imageiconurl,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    )
                  : Image.asset(
                      appointment.imageiconurl,
                      width: 36,
                      height: 36,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    ),
            ),
            const SizedBox(height: 12),
            Text(
              appointment.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xFF1D1D45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
