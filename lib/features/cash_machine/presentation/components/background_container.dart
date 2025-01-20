import 'package:atm_test/features/cash_machine/presentation/components/custom_container.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.angle, required this.height});
  final double angle;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * math.pi / 180,
      child: SizedBox(
        height: height,
        child: const Stack(
          children: [
            CustomContainer(
              heightKoef: 1.7,
              heightKoefEnd: .8,
              ax1: 0.1,
              ay1: 0.3,
              ax2: 0.6,
              bx1: 0.75,
              by1: 1.2,
              opacity: 0.9,
              height: 140,
            ),
            CustomContainer(
              heightKoef: .9,
              heightKoefEnd: 1.6,
              ax1: 0.25,
              ay1: 0.6,
              ax2: 0.6,
              bx1: 0.8,
              by1: 1.3,
              opacity: .6,
              height: 110,
            ),
          ],
        ),
      ),
    );
  }
}
