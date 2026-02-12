import 'package:atm_test/features/cash_machine/presentation/components/custom_container.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class _WaveParams {
  const _WaveParams({
    required this.heightKoef,
    required this.heightKoefEnd,
    required this.ax1,
    required this.ay1,
    required this.ax2,
    required this.bx1,
    required this.by1,
    required this.opacity,
    required this.height,
  });
  final double heightKoef;
  final double heightKoefEnd;
  final double ax1;
  final double ay1;
  final double ax2;
  final double bx1;
  final double by1;
  final double opacity;
  final double height;
}

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.angle, required this.height});
  final double angle;
  final double height;

  static const _wave1 = _WaveParams(
    heightKoef: 1.7,
    heightKoefEnd: 0.8,
    ax1: 0.1,
    ay1: 0.3,
    ax2: 0.6,
    bx1: 0.75,
    by1: 1.2,
    opacity: 0.9,
    height: 140,
  );
  static const _wave2 = _WaveParams(
    heightKoef: 0.9,
    heightKoefEnd: 1.6,
    ax1: 0.25,
    ay1: 0.6,
    ax2: 0.6,
    bx1: 0.8,
    by1: 1.3,
    opacity: 0.6,
    height: 110,
  );

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * math.pi / 180,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Stack(
          children: [
            CustomContainer(
              heightKoef: _wave1.heightKoef,
              heightKoefEnd: _wave1.heightKoefEnd,
              ax1: _wave1.ax1,
              ay1: _wave1.ay1,
              ax2: _wave1.ax2,
              bx1: _wave1.bx1,
              by1: _wave1.by1,
              opacity: _wave1.opacity,
              height: _wave1.height,
            ),
            CustomContainer(
              heightKoef: _wave2.heightKoef,
              heightKoefEnd: _wave2.heightKoefEnd,
              ax1: _wave2.ax1,
              ay1: _wave2.ay1,
              ax2: _wave2.ax2,
              bx1: _wave2.bx1,
              by1: _wave2.by1,
              opacity: _wave2.opacity,
              height: _wave2.height,
            ),
          ],
        ),
      ),
    );
  }
}
