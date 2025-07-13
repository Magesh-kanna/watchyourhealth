import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyourhealth/src/core/utils/theme_extension.dart';
import 'package:watchyourhealth/src/core/utils/watchyourhealth_button.dart';

/// [ThemeBottomSheet] will handle theme switching in the app
class ThemeBottomSheet extends StatefulWidget {
  /// initializes [key]
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    /// [themeDropdownItemList] contains [List] of [ThemeMode]
    final List<ThemeMode> themeDropdownItemList = [
      ThemeMode.system,
      ThemeMode.light,
      ThemeMode.dark,
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(),
              magnification: 1.22,
              useMagnifier: true,
              itemExtent: 40,
              squeeze: 1.2,
              onSelectedItemChanged: (int selectedItem) {
                setState(() {
                  print('theme changed to $selectedItem');
                });
              },
              children: themeDropdownItemList
                  .map(
                    (e) => Center(
                      child: Text(
                        e.displayThemeName,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 16),
          WatchYourHealthButton(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.65,
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }

              /// Actions for changing the theme throughout the app.
            },
            label: 'Change Theme',
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
