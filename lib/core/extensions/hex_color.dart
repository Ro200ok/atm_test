import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) {
    String toHexPart(double value) => (value * 255).round().toRadixString(16).padLeft(2, '0');

    return '${leadingHashSign ? '#' : ''}'
        '${toHexPart(a)}'
        '${toHexPart(r)}'
        '${toHexPart(g)}'
        '${toHexPart(b)}';
  }
}
