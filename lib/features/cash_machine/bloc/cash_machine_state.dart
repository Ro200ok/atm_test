part of 'cash_machine_bloc.dart';

@freezed
class CashMachineState with _$CashMachineState {
  const factory CashMachineState.initial(CashResultDto result) = _CashMachineStateInitial;
  const factory CashMachineState.loading() = _CashMachineStateLoading;
  const factory CashMachineState.success(CashResultDto result) = _CashMachineStateSuccess;
  const factory CashMachineState.failure(CashResultDto result) = _CashMachineStateFailure;
}
