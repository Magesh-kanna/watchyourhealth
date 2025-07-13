import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/app_colors.dart';
import 'package:watchyourhealth/src/core/utils/custom_snackbar.dart';
import 'package:watchyourhealth/src/features/appointment/data/appointment_model.dart';
import 'package:watchyourhealth/src/features/appointment/presentation/widgets/appointment_tile.dart';

class AppointmentListPage extends StatefulWidget {
  const AppointmentListPage({super.key, required this.appointments});

  final List<AppointmentModel> appointments;

  @override
  State<AppointmentListPage> createState() => _AppointmentListPageState();
}

class _AppointmentListPageState extends State<AppointmentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.wakeYourHealthPrimary,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 16),
                Text(
                  'Appointments',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.wakeYourHealthPrimary,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: widget.appointments.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: AppointmentTile(
                    appointment: widget.appointments[index],
                    onTap: () {
                      CustomSnackBar.showSuccess(
                        context,
                        message: widget.appointments[index].title,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
