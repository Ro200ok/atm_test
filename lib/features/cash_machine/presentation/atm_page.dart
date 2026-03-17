import 'package:atm_test/core/atm_app_theme.dart';
import 'package:atm_test/core/constants/layout_constants.dart';
import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/features/cash_machine/presentation/components/amount_container.dart';
import 'package:atm_test/features/cash_machine/presentation/components/atm_appbar.dart';
import 'package:atm_test/features/cash_machine/presentation/components/background_container.dart';
import 'package:atm_test/features/cash_machine/presentation/components/cash_machine_state_section.dart';
import 'package:atm_test/features/cash_machine/presentation/components/grid_component.dart';
import 'package:atm_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutConstants.atmPageDividerHeight,
      color: Colors.grey.withValues(alpha: LayoutConstants.atmPageDividerAlpha),
    );
  }
}

class AtmPage extends StatefulWidget {
  const AtmPage({super.key});

  @override
  State<AtmPage> createState() => _AtmPageState();
}

class _AtmPageState extends State<AtmPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tryToGetCache() {
    final cleanedInput = _controller.text.replaceAll(' ', '').replaceAll(',', '');
    final int? amount = int.tryParse(cleanedInput);
    if (amount == null) return;
    context.read<CashMachineBloc>().add(CashMachineEvent.tryToGetCache(amount));
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtmAppTheme.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    final gridHeight = screenHeight / LayoutConstants.atmGridHeightFactor;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AtmAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: LayoutConstants.atmPageSectionSpacing,
            children: [
              Stack(
                children: [
                  BackgroundContainer(
                    angle: 0,
                    height: screenHeight / LayoutConstants.atmHeaderHeightFactor,
                  ),
                  AmountContainer(
                    height: screenHeight / LayoutConstants.atmAmountSectionHeightFactor,
                    callback: _tryToGetCache,
                    controller: _controller,
                  )
                ],
              ),
              const _SectionDivider(),
              BlocBuilder<CashMachineBloc, CashMachineState>(
                builder: (context, state) {
                  return Column(
                    spacing: LayoutConstants.atmPageSectionSpacing,
                    children: [
                      CashMachineStateSection(
                        state: state,
                        sectionHeight: gridHeight,
                        contentBuilder: (result) => GridLayout(
                          height: gridHeight,
                          amounts: result.taken,
                          denominations: result.denominations,
                          title: S.of(context).ATM_dispensed_the_following_bills,
                        ),
                        failureBuilder: (_) => Container(
                          width: double.infinity,
                          height: gridHeight,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              S.of(context).ATM_cannot_dispense_the_requested_amount,
                              style: theme.textTypography.failureText(),
                            ),
                          ),
                        ),
                      ),
                      const _SectionDivider(),
                      CashMachineStateSection(
                        state: state,
                        sectionHeight: gridHeight,
                        contentBuilder: (result) => GridLayout(
                          height: gridHeight,
                          title: S.of(context).ATM_balance,
                          amounts: result.limits,
                          denominations: result.denominations,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const _SectionDivider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BackgroundContainer(
        angle: 180,
        height: screenHeight / LayoutConstants.atmBottomBarHeightFactor,
      ),
    );
  }
}
