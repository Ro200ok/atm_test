// ignore_for_file: depend_on_referenced_packages

import 'package:atm_test/features/cash_machine/data/model/cash_result_dto.dart';
import 'package:atm_test/features/cash_machine/domain/repositories/limits_repository_port.dart';
import 'package:atm_test/features/cash_machine/domain/withdraw_cash_use_case.dart';
import 'package:atm_test/shared/logging/app_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_machine_event.dart';
part 'cash_machine_state.dart';
part 'cash_machine_bloc.freezed.dart';

class CashMachineBloc extends Bloc<CashMachineEvent, CashMachineState> {
  CashMachineBloc({
    required LimitsRepositoryPort limitsRepository,
    required WithdrawCashUseCase withdrawCashUseCase,
    required AppLoggerItf logger,
  })  : _withdrawCashUseCase = withdrawCashUseCase,
        _logger = logger,
        super(CashMachineState.initial(_initialCashResult(limitsRepository))) {
    on<_CashMachineEventTryToGetCache>(_tryToGetCache);
  }

  final WithdrawCashUseCase _withdrawCashUseCase;
  final AppLoggerItf _logger;

  static CashResultDto _initialCashResult(LimitsRepositoryPort repo) {
    return CashResultDto(
      limits: repo.limits,
      denominations: repo.denominations,
      taken: [],
    );
  }

  void _tryToGetCache(_CashMachineEventTryToGetCache event, Emitter<CashMachineState> emit) {
    emit(const CashMachineState.loading());

    try {
      final result = _withdrawCashUseCase.execute(event.amount);
      final cashResult = CashResultDto(
        limits: result.remainingLimits,
        denominations: result.denominations,
        taken: result.taken,
      );
      if (result.ok) {
        emit(CashMachineState.success(cashResult));
      } else {
        emit(CashMachineState.failure(cashResult));
      }
    } on Object catch (e, st) {
      _logger.error('CashMachineBloc.tryToGetCache failed', error: e, stackTrace: st);
      emit(state);
    }
  }
}
