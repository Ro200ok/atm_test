abstract final class AtmConfig {
  AtmConfig._();

  /// (100₽, 200₽, 500₽, 1000₽, 2000₽, 5000₽).
  static const List<int> defaultLimits = [2, 1, 3, 3, 4, 2];
}
