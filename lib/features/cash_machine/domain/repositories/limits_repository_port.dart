abstract interface class LimitsRepositoryPort {
  /// Current limits per denomination (same order as [denominations]).
  List<int> get limits;

  /// Supported denominations (e.g. 100, 200, 500, 1000, 2000, 5000).
  List<int> get denominations;

  /// Updates stored limits after a successful withdrawal.
  set limits(List<int> value);
}
