import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/features/cash_machine/data/repositories/limits_repository.dart';
import 'package:atm_test/features/cash_machine/domain/withdraw_cash_use_case.dart';
import 'package:atm_test/shared/logging/app_logger.dart';
import 'package:atm_test/shared/logging/app_logger_impl.dart';
import 'package:atm_test/shared/logging/no_op_monitoring_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const denominations = [100, 200, 500, 1000, 2000, 5000];

  late LimitsRepository limitsRepository;
  late WithdrawCashUseCase withdrawCashUseCase;
  late AppLoggerItf logger;

  setUp(() {
    limitsRepository = LimitsRepository();
    withdrawCashUseCase = WithdrawCashUseCase(limitsRepository);
    logger = AppLoggerImpl(NoOpMonitoringService());
  });

  CashMachineBloc createBloc() => CashMachineBloc(
        limitsRepository: limitsRepository,
        withdrawCashUseCase: withdrawCashUseCase,
        logger: logger,
      );

  group('CashMachineBloc', () {
    test('начальное состояние — initial с cashResultDto из репозитория', () {
      limitsRepository.limits = [1, 1, 1, 1, 1, 1];
      final bloc = createBloc();

      expect(bloc.state, isA<CashMachineState>());
      expect(
        bloc.state.mapOrNull(initial: (r) => r.result.denominations),
        denominations,
      );
      expect(
        bloc.state.mapOrNull(initial: (r) => r.result.limits),
        [1, 1, 1, 1, 1, 1],
      );

      bloc.close();
    });

    test('tryToGetCache(5000) при одной купюре 5000: loading → success', () async {
      limitsRepository.limits = [0, 0, 0, 0, 0, 1];
      final bloc = createBloc();

      bloc.add(const CashMachineEvent.tryToGetCache(5000));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const CashMachineState.loading(),
          isA<CashMachineState>(),
        ]),
      );

      final successResult = bloc.state.mapOrNull(success: (r) => r.result);
      expect(successResult, isNotNull);
      expect(successResult!.taken, [0, 0, 0, 0, 0, 1]);
      expect(successResult.limits, [0, 0, 0, 0, 0, 0]);
      expect(limitsRepository.limits, [0, 0, 0, 0, 0, 0]);

      bloc.close();
    });

    test('tryToGetCache(100) при только 5000: loading → failure', () async {
      limitsRepository.limits = [0, 0, 0, 0, 0, 1];
      final bloc = createBloc();

      bloc.add(const CashMachineEvent.tryToGetCache(100));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const CashMachineState.loading(),
          isA<CashMachineState>(),
        ]),
      );

      final failureResult = bloc.state.mapOrNull(failure: (r) => r.result);
      expect(failureResult, isNotNull);
      expect(failureResult!.limits, [0, 0, 0, 0, 0, 1]); // при failure лимиты не меняются

      bloc.close();
    });

    test('при success лимиты в репозитории обновляются', () async {
      limitsRepository.limits = [10, 10, 10, 10, 10, 10];
      final bloc = createBloc();

      bloc.add(const CashMachineEvent.tryToGetCache(5000));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const CashMachineState.loading(),
          isA<CashMachineState>(),
        ]),
      );

      expect(limitsRepository.limits, [10, 10, 10, 10, 10, 9]);
      bloc.close();
    });

    test('при failure лимиты в репозитории не меняются', () async {
      limitsRepository.limits = [0, 0, 0, 0, 0, 1];
      final bloc = createBloc();

      bloc.add(const CashMachineEvent.tryToGetCache(99999));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const CashMachineState.loading(),
          isA<CashMachineState>(),
        ]),
      );

      expect(limitsRepository.limits, [0, 0, 0, 0, 0, 1]);
      bloc.close();
    });
  });
}
