// ignore_for_file: depend_on_referenced_packages

import 'package:atm_test/features/cash_machine/data/model/cash_result_dto.dart';
import 'package:atm_test/features/cash_machine/data/repositories/limits_repository.dart';
import 'package:atm_test/shared/atm_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_machine_event.dart';
part 'cash_machine_state.dart';
part 'cash_machine_bloc.freezed.dart';

class CashMachineBloc extends Bloc<CashMachineEvent, CashMachineState> {
  final LimitsRepository _limitsRepository;
  final AtmLogger _atmLogger;

  CashMachineBloc({required LimitsRepository limitsRepository, required AtmLogger atmLogger})
      : _limitsRepository = limitsRepository,
        _atmLogger = atmLogger,
        super(CashMachineState.initial(limitsRepository.cashResultDto)) {
    on<_CashMachineEventTryToGetCache>(_tryToGetCache);
  }

  void _tryToGetCache(_CashMachineEventTryToGetCache event, Emitter<CashMachineState> emit) {
    emit(const CashMachineState.loading());

    try {
      final int amount = event.amount;
      final List<int> denominations = _limitsRepository.denominations;
      final (List<int>, List<int>) result = _withdraw(amount, _limitsRepository.limits, denominations);

      if (result.$2.length == 1 && result.$2[0] == -1) {
        final cachResult = CashResultDto(limits: result.$1, denominations: denominations, diffValues: result.$2);
        emit(CashMachineState.failure(cachResult));
        return;
      } else {
        final cachResult = CashResultDto(limits: result.$1, denominations: denominations, diffValues: result.$2);
        _limitsRepository.limits = result.$1;
        emit(CashMachineState.success(cachResult));
      }
    } catch (e, st) {
      _atmLogger.captureExeption(e, st);
      emit(state);
    }
  }

  (List<int>, List<int>) _withdraw(int amount, List<int> limits, List<int> denominations) {
    List<int> diffValue = [0, 0, 0, 0, 0, 0];

    for (int i = limits.length - 1; i >= 0; i--) {
      if (limits[i] == 0) continue;
      int tmpBanknote = amount ~/ denominations[i];
      if (tmpBanknote >= 1) {
        int tmpBanknoteDiff = limits[i] - tmpBanknote;
        if (tmpBanknoteDiff < 0) {
          amount = amount - tmpBanknote * denominations[i] - tmpBanknoteDiff * denominations[i];
          diffValue[i] += tmpBanknote + tmpBanknoteDiff;
        } else {
          amount -= tmpBanknote * denominations[i];
          diffValue[i] += tmpBanknote;
        }
      }
    }
    if (amount == 0) {
      for (int i = 0; i < limits.length; i++) {
        limits[i] -= diffValue[i];
      }

      return (limits, diffValue);
    } else {
      return (limits, [-1]);
    }
  }
}
