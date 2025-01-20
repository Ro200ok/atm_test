import 'package:atm_test/atm_app.dart';
import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/di.dart';
import 'package:atm_test/features/cash_machine/data/repositories/limits_repository.dart';
import 'package:atm_test/shared/atm_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> $initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized().deferFirstFrame();

  Bloc.transformer = concurrency.sequential();

  // Initializing dependencies

  injector.registerLazySingleton<AtmLogger>(
    () => AtmLogger(),
  );

  injector.registerLazySingleton<LimitsRepository>(
    () => LimitsRepository(),
  );

  injector<LimitsRepository>().limits = [2, 1, 3, 3, 4, 2]; // [100, 200, 500, 1000, 2000, 5000];

  injector.registerFactory<CashMachineBloc>(
    () => CashMachineBloc(
      atmLogger: injector<AtmLogger>(),
      limitsRepository: injector<LimitsRepository>(),
    ),
  );

  // Launching app
  runApp(
    const Di(child: AtmApp()),
  );
}
