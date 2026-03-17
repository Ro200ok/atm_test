import 'package:atm_test/features/cash_machine/domain/repositories/limits_repository_port.dart';
import 'package:atm_test/features/cash_machine/domain/withdraw_calculator.dart';

typedef WithdrawCashResult = ({
  bool ok,
  List<int> remainingLimits,
  List<int> taken,
  List<int> denominations,
});

class WithdrawCashUseCase {
  WithdrawCashUseCase(this._repository);

  final LimitsRepositoryPort _repository;

  WithdrawCashResult execute(int amount) {
    final limits = _repository.limits;
    final denominations = _repository.denominations;
    final result = WithdrawCalculator.withdraw(amount, limits, denominations);

    if (result.ok) {
      _repository.limits = result.remainingLimits;
    }

    return (
      ok: result.ok,
      remainingLimits: result.remainingLimits,
      taken: result.taken,
      denominations: denominations,
    );
  }
}
