import 'package:atm_test/core/atm_app_theme.dart';
import 'package:atm_test/core/constants/layout_constants.dart';
import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({super.key, required this.amounts, required this.denominations, required this.title, this.height});
  final List<int> amounts;
  final List<int> denominations;
  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = AtmAppTheme.of(context);
    return Container(
      height: height,
      padding: const EdgeInsets.all(LayoutConstants.gridPadding),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: LayoutConstants.gridTitleBottomSpacing),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: LayoutConstants.gridCrossAxisCount,
                childAspectRatio: LayoutConstants.gridChildAspectRatio,
                mainAxisSpacing: 0,
                crossAxisSpacing: LayoutConstants.gridCrossAxisSpacing,
                mainAxisExtent: LayoutConstants.gridMainAxisExtent),
            itemBuilder: (_, index) => Row(
              children: [
                Text(
                  '${amounts[index]} X ',
                  style: theme.textTypography.body1(),
                ),
                Text(
                  '${denominations[index]}  рублей',
                  style: theme.textTypography.body1(),
                )
              ],
            ),
            itemCount: amounts.length,
          ),
        ],
      ),
    );
  }
}
