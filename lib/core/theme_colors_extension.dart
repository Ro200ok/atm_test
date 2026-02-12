import 'package:flutter/material.dart';

@immutable
class ThemeColorsExtension extends ThemeExtension<ThemeColorsExtension> {
  final Color mainBackgroundGrL;
  final Color mainBackgroundGrR;
  final Color buttonColor;
  final Color defaultWhite;
  final Color descriptionTextColor;
  final Color denominationsTextColor;

  const ThemeColorsExtension({
    required this.mainBackgroundGrL,
    required this.mainBackgroundGrR,
    required this.buttonColor,
    required this.defaultWhite,
    required this.descriptionTextColor,
    required this.denominationsTextColor,
  });

  factory ThemeColorsExtension.light() => const ThemeColorsExtension(
        mainBackgroundGrL: Color(0xFF3827B4),
        mainBackgroundGrR: Color(0xFF6C18A4),
        buttonColor: Color(0xFFE61EAD),
        defaultWhite: Color.fromARGB(255, 255, 255, 255),
        descriptionTextColor: Color.fromARGB(255, 163, 162, 172),
        denominationsTextColor: Color.fromARGB(255, 56, 39, 180),
      );

  factory ThemeColorsExtension.dark() => const ThemeColorsExtension(
        mainBackgroundGrL: Color(0xFF4D3AC4),
        mainBackgroundGrR: Color(0xFF7C28B4),
        buttonColor: Color(0xFFE61EAD),
        defaultWhite: Color.fromARGB(255, 255, 255, 255),
        descriptionTextColor: Color.fromARGB(255, 190, 189, 199),
        denominationsTextColor: Color.fromARGB(255, 180, 170, 255),
      );

  @override
  ThemeColorsExtension copyWith({
    Color? mainBackgroundGrL,
    Color? mainBackgroundGrR,
    Color? buttonColor,
    Color? defaultWhite,
    Color? descriptionTextColor,
    Color? denominationsTextColor,
  }) {
    return ThemeColorsExtension(
      mainBackgroundGrL: mainBackgroundGrL ?? this.mainBackgroundGrL,
      mainBackgroundGrR: mainBackgroundGrR ?? this.mainBackgroundGrR,
      buttonColor: buttonColor ?? this.buttonColor,
      defaultWhite: defaultWhite ?? this.defaultWhite,
      descriptionTextColor: descriptionTextColor ?? this.descriptionTextColor,
      denominationsTextColor: denominationsTextColor ?? this.denominationsTextColor,
    );
  }

  @override
  ThemeColorsExtension lerp(covariant ThemeColorsExtension? other, double t) {
    if (other == null) return this;
    return ThemeColorsExtension(
      mainBackgroundGrL: Color.lerp(mainBackgroundGrL, other.mainBackgroundGrL, t)!,
      mainBackgroundGrR: Color.lerp(mainBackgroundGrR, other.mainBackgroundGrR, t)!,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      defaultWhite: Color.lerp(defaultWhite, other.defaultWhite, t)!,
      descriptionTextColor: Color.lerp(descriptionTextColor, other.descriptionTextColor, t)!,
      denominationsTextColor: Color.lerp(denominationsTextColor, other.denominationsTextColor, t)!,
    );
  }
}
