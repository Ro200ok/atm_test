import 'package:atm_test/core/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;

  final double opacity;
  final double ax1;
  final double ay1;
  final double ax2;
  final double bx1;
  final double by1;
  final double heightKoef;
  final double heightKoefEnd;

  const CustomContainer({
    super.key,
    required this.height,
    required this.opacity,
    required this.ax1,
    required this.ay1,
    required this.ax2,
    required this.bx1,
    required this.by1,
    required this.heightKoef,
    required this.heightKoefEnd,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColorsExtension>()!;
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: CustomPaint(
          painter: WavePainter(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  colors.mainBackgroundGrL,
                  colors.mainBackgroundGrR,
                ],
              ),
              ax1,
              ay1,
              ax2,
              bx1,
              by1,
              heightKoef,
              heightKoefEnd),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Gradient gradient;
  final double ax1;
  final double ay1;
  final double ax2;
  final double bx1;
  final double by1;
  final double heightKoefStr;
  final double heightKoefEnd;

  WavePainter(this.ax1, this.ay1, this.ax2, this.bx1, this.by1, this.heightKoefStr, this.heightKoefEnd,
      {required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    path.moveTo(0, size.height / heightKoefStr);

    path.quadraticBezierTo(size.width * ax1, size.height * ay1, size.width * ax2, size.height);
    path.quadraticBezierTo(size.width * bx1, size.height * by1, size.width, size.height * heightKoefEnd);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
