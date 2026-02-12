import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/features/cash_machine/data/model/cash_result_dto.dart';
import 'package:flutter/material.dart';

class _LoadingPlaceholder extends StatelessWidget {
  const _LoadingPlaceholder({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class CashMachineStateSection extends StatelessWidget {
  const CashMachineStateSection({
    super.key,
    required this.state,
    required this.sectionHeight,
    required this.contentBuilder,
    this.failureBuilder,
  });

  final CashMachineState state;
  final double sectionHeight;
  final Widget Function(CashResultDto result) contentBuilder;
  final Widget Function(CashResultDto result)? failureBuilder;

  @override
  Widget build(BuildContext context) {
    return state.when(
      initial: contentBuilder,
      loading: () => _LoadingPlaceholder(height: sectionHeight),
      success: contentBuilder,
      failure: (result) => (failureBuilder ?? contentBuilder)(result),
    );
  }
}
