import 'package:atm_test/core/theme_colors_extension.dart';
import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class AtmAppTheme extends InheritedWidget {
  final AtmAppThemeData data;

  const AtmAppTheme({required this.data, required super.child, super.key});

  static AtmAppThemeData of(BuildContext context) {
    final theme = context.findAncestorWidgetOfExactType<AtmAppTheme>();

    if (theme == null) throw UnsupportedError('Невозможно найти тему. Использование AtmAppThemeData невозможно.');

    return theme.data;
  }

  @override
  bool updateShouldNotify(covariant AtmAppTheme oldWidget) => data != oldWidget.data;
}

class AtmAppThemeData {
  final ElevatedButtonStyle elevatedButtonStyle;
  final TextTypography textTypography;

  AtmAppThemeData.light(ThemeColorsExtension colors)
      : elevatedButtonStyle = ElevatedButtonStyle(
          primary: ElevatedButton.styleFrom(
            foregroundColor: colors.defaultWhite,
            backgroundColor: colors.buttonColor,
            textStyle: const TextStyle(fontFamily: 'Sf Pro', fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        textTypography = TextTypography(
          primaryTextColor: colors.defaultWhite,
          secondaryTextColor: colors.denominationsTextColor,
          failureColor: colors.buttonColor,
          body1Color: colors.denominationsTextColor,
        );
}

class ElevatedButtonStyle {
  final ButtonStyle primary;
  const ElevatedButtonStyle({required this.primary});
}

class TextTypography {
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color failureColor;
  final Color body1Color;

  const TextTypography({
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.failureColor,
    required this.body1Color,
  });

  TextStyle display1({Color? color, FontWeight weight = FontWeight.w500}) => TextStyle(
        color: color ?? primaryTextColor,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 30,
        height: 64 / 48,
      );

  TextStyle title1({Color? color, FontWeight weight = FontWeight.w400}) => TextStyle(
        color: color ?? primaryTextColor,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 15,
        height: 40 / 32,
      );

  TextStyle title2({Color? color, FontWeight weight = FontWeight.w500}) => TextStyle(
        color: color ?? primaryTextColor,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 16,
        height: 40 / 32,
      );

  TextStyle body3({Color? color, FontWeight weight = FontWeight.w400}) => TextStyle(
        color: color ?? primaryTextColor,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 13,
        height: 28 / 20,
      );

  TextStyle failureText({Color? color, FontWeight weight = FontWeight.w400}) => TextStyle(
        color: color ?? failureColor,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 18,
        height: 28 / 20,
      );

  TextStyle body1({Color? color, FontWeight weight = FontWeight.w500}) => TextStyle(
        color: color ?? body1Color,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 14,
      );
}
