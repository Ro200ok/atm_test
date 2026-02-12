/// Result of the withdraw calculation.
typedef WithdrawResult = ({
  bool ok,
  List<int> remainingLimits,
  List<int> taken,
});

/// Greedy algorithm for withdrawal: from the largest denomination to the smallest.
/// Complexity O(n), input lists are not mutated.
class WithdrawCalculator {
  static WithdrawResult withdraw(
    int amount,
    List<int> limits,
    List<int> denominations,
  ) {
    _validateInputs(amount, limits, denominations);

    final remainingLimits = List<int>.from(limits);
    final taken = List<int>.filled(limits.length, 0);
    int remaining = amount;

    // Go from the largest denomination to the smallest.
    for (int i = remainingLimits.length - 1; i >= 0; i--) {
      if (remainingLimits[i] == 0) continue;

      final denomination = denominations[i];
      final maxPossible = remaining ~/ denomination;
      if (maxPossible < 1) continue;

      final take = maxPossible <= remainingLimits[i] ? maxPossible : remainingLimits[i];

      remaining -= take * denomination;
      taken[i] = take;
    }

    if (remaining != 0) {
      return (ok: false, remainingLimits: List<int>.from(limits), taken: taken);
    }

    // Success: subtract the withdrawn from the limits.
    for (int i = 0; i < remainingLimits.length; i++) {
      remainingLimits[i] -= taken[i];
    }
    return (ok: true, remainingLimits: remainingLimits, taken: taken);
  }

  static void _validateInputs(int amount, List<int> limits, List<int> denominations) {
    if (amount < 0) {
      throw ArgumentError('amount must be >= 0', 'amount');
    }
    if (limits.length != denominations.length) {
      throw ArgumentError(
        'limits.length (${limits.length}) must equal denominations.length (${denominations.length})',
      );
    }
    for (var i = 0; i < denominations.length; i++) {
      if (denominations[i] <= 0) {
        throw ArgumentError('denominations[$i] must be > 0', 'denominations');
      }
    }
  }
}
