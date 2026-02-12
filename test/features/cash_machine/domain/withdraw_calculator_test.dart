import 'package:atm_test/features/cash_machine/domain/withdraw_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const denominations = [100, 200, 500, 1000, 2000, 5000];

  group('WithdrawCalculator', () {
    test('ok == true при успешной выдаче', () {
      final result = WithdrawCalculator.withdraw(5000, [0, 0, 0, 0, 0, 1], denominations);
      expect(result.ok, isTrue);
    });

    test('ok == false при невозможности выдать', () {
      final result = WithdrawCalculator.withdraw(100, [0, 0, 0, 0, 0, 1], denominations);
      expect(result.ok, isFalse);
    });

    test('выдаёт одну купюру максимального номинала', () {
      final limits = [0, 0, 0, 0, 0, 1];
      final result = WithdrawCalculator.withdraw(5000, limits, denominations);

      expect(result.ok, isTrue);
      expect(result.taken, [0, 0, 0, 0, 0, 1]);
      expect(result.remainingLimits, [0, 0, 0, 0, 0, 0]);
    });

    test('выдаёт несколько номиналов (жадный алгоритм)', () {
      final limits = [0, 0, 0, 1, 1, 1];
      final result = WithdrawCalculator.withdraw(8000, limits, denominations);

      expect(result.ok, isTrue);
      expect(result.taken, [0, 0, 0, 1, 1, 1]);
      expect(result.remainingLimits, [0, 0, 0, 0, 0, 0]);
    });

    test('уменьшает лимиты только по выданным купюрам', () {
      final limits = [10, 10, 10, 10, 10, 10];
      final result = WithdrawCalculator.withdraw(5000, limits, denominations);

      expect(result.taken, [0, 0, 0, 0, 0, 1]);
      expect(result.remainingLimits, [10, 10, 10, 10, 10, 9]);
    });

    test('ok == false, когда сумму выдать невозможно', () {
      final limits = [0, 0, 0, 0, 0, 1];
      final result = WithdrawCalculator.withdraw(100, limits, denominations);

      expect(result.ok, isFalse);
      expect(result.remainingLimits, [0, 0, 0, 0, 0, 1]);
    });

    test('ok == false при нехватке купюр', () {
      final limits = [0, 0, 0, 0, 0, 1];
      final result = WithdrawCalculator.withdraw(10000, limits, denominations);

      expect(result.ok, isFalse);
    });

    test('не мутирует переданный список limits', () {
      final limits = [1, 1, 1, 1, 1, 1];
      final original = List<int>.from(limits);
      WithdrawCalculator.withdraw(5000, limits, denominations);

      expect(limits, original);
    });

    test('сумма 0 — выдаёт нули и не меняет лимиты', () {
      final limits = [2, 2, 2, 2, 2, 2];
      final result = WithdrawCalculator.withdraw(0, limits, denominations);

      expect(result.ok, isTrue);
      expect(result.taken, [0, 0, 0, 0, 0, 0]);
      expect(result.remainingLimits, [2, 2, 2, 2, 2, 2]);
    });

    test('учёт нулевых лимитов по номиналу', () {
      final limits = [0, 0, 2, 0, 0, 0];
      final result = WithdrawCalculator.withdraw(1000, limits, denominations);

      expect(result.taken, [0, 0, 2, 0, 0, 0]);
      expect(result.remainingLimits, [0, 0, 0, 0, 0, 0]);
    });

    test('amount < 0 выбрасывает ArgumentError', () {
      expect(
        () => WithdrawCalculator.withdraw(-1, [1, 1, 1, 1, 1, 1], denominations),
        throwsArgumentError,
      );
    });

    test('несовпадение длин limits и denominations выбрасывает ArgumentError', () {
      expect(
        () => WithdrawCalculator.withdraw(100, [1, 1], denominations),
        throwsArgumentError,
      );
    });

    test('номинал <= 0 выбрасывает ArgumentError', () {
      expect(
        () => WithdrawCalculator.withdraw(100, [1, 1, 1, 1, 1, 1], [100, 200, 0, 1000, 2000, 5000]),
        throwsArgumentError,
      );
    });
  });
}
