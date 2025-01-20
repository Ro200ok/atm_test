import 'package:atm_test/core/atm_app_theme.dart';
import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/features/cash_machine/presentation/components/amount_container.dart';
import 'package:atm_test/features/cash_machine/presentation/components/atm_appbar.dart';
import 'package:atm_test/features/cash_machine/presentation/components/background_container.dart';
import 'package:atm_test/features/cash_machine/presentation/components/grid_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atm_test/generated/l10n.dart';

class AtmPage extends StatefulWidget {
  const AtmPage({super.key});

  @override
  State<AtmPage> createState() => _AtmPageState();
}

class _AtmPageState extends State<AtmPage> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AtmAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        spacing: 5,
        children: [
          Stack(
            children: [
              const BackgroundContainer(
                angle: 0,
                height: 140,
              ),
              // ... other CustomContainers
              AmountContainer(
                callback: _tryToGetCache,
                controller: _controller,
              )
            ],
          ),
          Container(
            height: 10,
            color: Colors.grey.withValues(alpha: 200),
          ),
          BlocBuilder<CashMachineBloc, CashMachineState>(
            builder: (context, state) => state.when(
              initial: (result) => GridLayout(
                  height: 150,
                  amounts: result.diffValues,
                  denominations: result.denominations,
                  titie: S.of(context).ATM_dispensed_the_following_bills),
              loading: () => Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.white,
                  child: const Center(child: CircularProgressIndicator())),
              success: (result) => GridLayout(
                titie: S.of(context).ATM_dispensed_the_following_bills,
                amounts: result.diffValues,
                denominations: result.denominations,
              ),
              failure: (_) => Container(
                width: double.infinity,
                height: 150,
                color: Colors.white,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).ATM_cannot_dispense_the_requested_amount,
                    style: theme.textTypografy.failureText(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.grey.withValues(alpha: 200),
          ),
          BlocBuilder<CashMachineBloc, CashMachineState>(
            builder: (context, state) => state.when(
              initial: (result) => GridLayout(
                  height: 150,
                  amounts: result.limits,
                  denominations: result.denominations,
                  titie: S.of(context).ATM_balance),
              loading: () => Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.white,
                  child: const Center(child: CircularProgressIndicator())),
              success: (result) => GridLayout(
                titie: S.of(context).ATM_balance,
                amounts: result.limits,
                denominations: result.denominations,
              ),
              failure: (result) => GridLayout(
                titie: S.of(context).ATM_balance,
                amounts: result.limits,
                denominations: result.denominations,
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.grey.withValues(alpha: 200),
          ),
          Flexible(
            child: Container(
              height: 200,
              color: Colors.white,
            ),
          )
        ],
      ),
      bottomSheet: const BackgroundContainer(
        angle: 180,
        height: 60,
      ),
    );
  }
}
