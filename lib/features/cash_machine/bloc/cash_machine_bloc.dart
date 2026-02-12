// ignore_for_file: depend_on_referenced_packages

import 'package:atm_test/features/cash_machine/data/model/cash_result_dto.dart';
import 'package:atm_test/features/cash_machine/data/repositories/limits_repository.dart';
import 'package:atm_test/features/cash_machine/domain/withdraw_calculator.dart';
import 'package:atm_test/shared/logging/app_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_machine_event.dart';
part 'cash_machine_state.dart';
part 'cash_machine_bloc.freezed.dart';

class CashMachineBloc extends Bloc<CashMachineEvent, CashMachineState> {
  final LimitsRepository _limitsRepository;
  final AppLoggerItf _logger;

  CashMachineBloc({required LimitsRepository limitsRepository, required AppLoggerItf logger})
      : _limitsRepository = limitsRepository,
        _logger = logger,
        super(CashMachineState.initial(limitsRepository.cashResultDto)) {
    on<_CashMachineEventTryToGetCache>(_tryToGetCache);
  }

  void _tryToGetCache(_CashMachineEventTryToGetCache event, Emitter<CashMachineState> emit) {
    emit(const CashMachineState.loading());

    try {
      final int amount = event.amount;
      final List<int> denominations = _limitsRepository.denominations;
      final result = WithdrawCalculator.withdraw(
        amount,
        _limitsRepository.limits,
        denominations,
      );

      if (!result.ok) {
        final cashResult = CashResultDto(
          limits: result.remainingLimits,
          denominations: denominations,
          taken: result.taken,
        );
        emit(CashMachineState.failure(cashResult));
        return;
      }
      final cashResult = CashResultDto(
        limits: result.remainingLimits,
        denominations: denominations,
        taken: result.taken,
      );
      _limitsRepository.limits = result.remainingLimits;
      emit(CashMachineState.success(cashResult));
    } on Object catch (e, st) {
      _logger.error('CashMachineBloc.tryToGetCache failed', error: e, stackTrace: st);
      emit(state);
    }
  }
}
