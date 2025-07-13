import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchyourhealth/src/core/utils/extensions.dart';
import 'package:watchyourhealth/src/features/homepage/data/appointment_model.dart';

class AppointmentTile extends StatelessWidget {
  const AppointmentTile({super.key, required this.data});

  final AppointmentModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: data.background,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: data.imageiconurl.isNetworkImage
                ? Image.network(data.imageiconurl)
                : Image.asset(data.imageiconurl, width: 36, height: 36),
          ),
          const SizedBox(height: 12),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF1D1D45),
            ),
          ),
        ],
      ),
    );
  }
}
