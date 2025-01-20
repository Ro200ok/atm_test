import 'package:atm_test/core/atm_app_assets.dart';
import 'package:atm_test/core/atm_app_colors.dart';
import 'package:flutter/material.dart';

class AtmAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AtmAppBar({Key? key, this.height = 80}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        elevation: 8,
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Image.asset(
                AtmAppAssets.atmLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AtmAppColors.mainBackroundGrL,
                AtmAppColors.mainBackroundGrR,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
