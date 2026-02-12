import 'package:atm_test/core/atm_app_theme.dart';
import 'package:atm_test/features/cash_machine/presentation/components/thousands_sep_formatter.dart';
import 'package:atm_test/generated/l10n.dart';
import 'package:flutter/material.dart';

class AmountContainer extends StatelessWidget {
  const AmountContainer({super.key, required this.callback, required this.controller, required this.height});
  final VoidCallback callback;
  final TextEditingController controller;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = AtmAppTheme.of(context);
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      color: Colors.transparent,
      child: Column(
        children: [
          Text(
            S.of(context).enter_sum,
            style: theme.textTypography.title1(),
          ),
          SizedBox(
            width: 200,
            child: TextField(
              style: theme.textTypography.display1(),
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                ThousandsSeparatorInputFormatter(),
              ],
              decoration: InputDecoration(
                suffix: Text(
                  S.of(context).ruble,
                  style: theme.textTypography.display1(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: callback,
            style: theme.elevatedButtonStyle.primary,
            child: Text(
              S.of(context).get_the_amount,
              style: theme.textTypography.title2(),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
