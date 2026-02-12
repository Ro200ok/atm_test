import 'package:atm_test/atm_app.dart';
import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/di.dart';
import 'package:atm_test/features/cash_machine/data/config/atm_config.dart';
import 'package:atm_test/features/cash_machine/data/repositories/limits_repository.dart';
import 'package:atm_test/shared/logging/app_logger.dart';
import 'package:atm_test/shared/logging/app_logger_impl.dart';
import 'package:atm_test/shared/logging/monitoring_service.dart';
import 'package:atm_test/shared/logging/no_op_monitoring_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void registerCoreDependencies() {
  injector.registerLazySingleton<MonitoringService>(
    () => NoOpMonitoringService(),
  );
  injector.registerLazySingleton<AppLoggerItf>(
    () => AppLoggerImpl(
      injector<MonitoringService>(),
      minimumLevel: LogLevel.info,
      enableInfoInRelease: false,
    ),
  );
}

Future<void> $initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized().deferFirstFrame();

  Bloc.transformer = concurrency.sequential();

  injector.registerLazySingleton<LimitsRepository>(
    () => LimitsRepository(AtmConfig.defaultLimits),
  );

  injector.registerFactory<CashMachineBloc>(
    () => CashMachineBloc(
      logger: injector<AppLoggerItf>(),
      limitsRepository: injector<LimitsRepository>(),
    ),
  );

  // Запуск приложения
  runApp(
    const Di(child: AtmApp()),
  );
}
