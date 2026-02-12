// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';

class CashResultDto {
  final List<int> limits;
  final List<int> denominations;
  final List<int> taken;

  CashResultDto({
    required this.limits,
    required this.denominations,
    required this.taken,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CashResultDto) return false;

    const listEquality = DeepCollectionEquality();
    return listEquality.equals(limits, other.limits) &&
        listEquality.equals(denominations, other.denominations) &&
        listEquality.equals(taken, other.taken);
  }

  @override
  int get hashCode {
    const listEquality = DeepCollectionEquality();
    return Object.hash(
      listEquality.hash(limits),
      listEquality.hash(denominations),
      listEquality.hash(taken),
    );
  }
}
