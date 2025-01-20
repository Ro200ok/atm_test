import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/runner_io.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Di extends StatelessWidget {
  final Widget child;
  const Di({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => injector<CashMachineBloc>(),
      ),

      // another providers
    ], child: child);
  }
}
