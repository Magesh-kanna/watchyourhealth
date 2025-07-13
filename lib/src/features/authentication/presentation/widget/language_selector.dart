import 'package:flutter/material.dart';

class LanguageSelectorWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const LanguageSelectorWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                border: Border.all(width: 0.7, color: Colors.grey),
              ),
              padding: EdgeInsetsGeometry.all(4),
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/uk_flag.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 12,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Eng',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.black54,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
