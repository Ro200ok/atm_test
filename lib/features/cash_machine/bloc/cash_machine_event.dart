part of 'cash_machine_bloc.dart';

@freezed
class CashMachineEvent with _$CashMachineEvent {
  const factory CashMachineEvent.tryToGetCache(int amount) = _CashMachineEventTryToGetCache;
}
