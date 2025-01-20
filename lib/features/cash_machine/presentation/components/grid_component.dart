import 'package:atm_test/core/atm_app_theme.dart';
import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({super.key, required this.amounts, required this.denominations, required this.titie, this.height});
  final List<int> amounts;
  final List<int> denominations;
  final String titie;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = AtmAppTheme.of(context);
    return Container(
      height: height,
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titie,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 8, mainAxisSpacing: 0, crossAxisSpacing: 10, mainAxisExtent: 20),
            itemBuilder: (_, index) => Row(
              children: [
                Text(
                  '${amounts[index]} X ',
                  style: theme.textTypografy.body1(),
                ),
                Text(
                  '${denominations[index]}  рублей',
                  style: theme.textTypografy.body1(),
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
