import 'package:atm_test/core/atm_app_colors.dart';
import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class AtmAppTheme extends InheritedWidget {
  AtmAppThemeData data;

  AtmAppTheme({required super.child, super.key}) : data = AtmAppThemeData.light();

  static AtmAppThemeData of(BuildContext context) {
    final theme = context.findAncestorWidgetOfExactType<AtmAppTheme>();

    if (theme == null) throw UnsupportedError('Невозможно найти тему. Использование AtmAppThemeData невозможно.');

    return theme.data;
  }

  @override
  bool updateShouldNotify(covariant AtmAppTheme oldWidget) => data != oldWidget.data;
}

class AtmAppThemeData {
  late final ElevatedButtonStyle elevatedButtonStyle;
  late final TextTypografy textTypografy;

  AtmAppThemeData.light() {
    elevatedButtonStyle = ElevatedButtonStyle(
      primary: ElevatedButton.styleFrom(
        foregroundColor: AtmAppColors.defaultWhite,
        backgroundColor: AtmAppColors.buttonColor,
        textStyle: const TextStyle(fontFamily: 'Sf Pro', fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );

    textTypografy = const TextTypografy(
        primaryTextColor: AtmAppColors.defaultWhite, secondaryTextColor: AtmAppColors.denominationsTextColor);
  }
}

class ElevatedButtonStyle {
  final ButtonStyle primary;
  const ElevatedButtonStyle({required this.primary});
}

class TextTypografy {
  final Color primaryTextColor;
  final Color secondaryTextColor;

  const TextTypografy({
    required this.primaryTextColor,
    required this.secondaryTextColor,
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
        color: AtmAppColors.buttonColor,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 18,
        height: 28 / 20,
      );

  TextStyle body1({Color? color, FontWeight weight = FontWeight.w500}) => TextStyle(
        color: AtmAppColors.denominationsTextColor,
        fontFamily: 'Sf Pro',
        fontFamilyFallback: const ['Roboto'],
        fontWeight: weight,
        fontSize: 14,
      );
}
