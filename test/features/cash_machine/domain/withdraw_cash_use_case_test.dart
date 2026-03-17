import 'package:atm_test/features/cash_machine/data/repositories/limits_repository.dart';
import 'package:atm_test/features/cash_machine/domain/withdraw_cash_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WithdrawCashUseCase', () {
    test('execute: success updates repository limits', () {
      final repo = LimitsRepository([0, 0, 0, 0, 0, 1]);
      final useCase = WithdrawCashUseCase(repo);

      final result = useCase.execute(5000);

      expect(result.ok, isTrue);
      expect(result.taken, [0, 0, 0, 0, 0, 1]);
      expect(result.remainingLimits, [0, 0, 0, 0, 0, 0]);
      expect(repo.limits, [0, 0, 0, 0, 0, 0]);
    });

    test('execute: failure does not update repository limits', () {
      final repo = LimitsRepository([0, 0, 0, 0, 0, 1]);
      final useCase = WithdrawCashUseCase(repo);

      final result = useCase.execute(100);

      expect(result.ok, isFalse);
      expect(result.remainingLimits, [0, 0, 0, 0, 0, 1]);
      expect(repo.limits, [0, 0, 0, 0, 0, 1]);
    });

    test('execute: returns correct denominations', () {
      const denominations = [100, 200, 500, 1000, 2000, 5000];
      final repo = LimitsRepository([1, 1, 1, 1, 1, 1]);
      final useCase = WithdrawCashUseCase(repo);

      final result = useCase.execute(5000);

      expect(result.denominations, denominations);
    });
  });
}
