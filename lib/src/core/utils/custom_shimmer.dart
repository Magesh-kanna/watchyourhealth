import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListPage extends StatelessWidget {
  const ShimmerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 2),
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 20.0,
              ),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
